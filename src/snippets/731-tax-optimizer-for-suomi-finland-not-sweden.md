---
id: '731'
title: Tax Optimizer For Suomi/Finland, not Sweden
languages:
- ruby
tags:
- desktop
- docker
- podman
---
Usage:


```ruby
$ ruby vero.rb --gross-income-step 1000 --gross-income 20000-35000 --capital-income-step 1000 --capital-income 0-20000
Usage: ruby vero.rb [options]
        --entrepreneur [ARG]         Y/N (FöPL/YEL is assumed to be equal to gross income)
        --gross-income [ARG]         Gross income range, e.g. 25000-30000
        --gross-income-step [ARG]    Gross income step, e.g. 1000
        --capital-income [ARG]       Capital income range, e.g. 0-20000
        --capital-income-step [ARG]  Capital income step, e.g. 1000
    -h, --help                       Display this help
```
    

Save this file to vero.rb (edit it if you're not me):


```ruby
require 'mechanize'
require 'pry'
require 'csv'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby vero.rb [options]"
  opts.on('--entrepreneur [ARG]', "Y/N (FöPL/YEL is assumed to be equal to gross income)") do |v|
    options[:entrepreneur] = v.strip.downcase == 'y'
  end
  opts.on('--gross-income [ARG]', "Gross income range, e.g. 25000-30000") do |v|
    parts = v.split('-')
    options[:gross_income_range] = (parts[0].to_f..parts[1].to_f)
  end
  opts.on('--gross-income-step [ARG]', "Gross income step, e.g. 1000") do |v|
    options[:gross_income_step] = v.to_f
  end
  opts.on('--capital-income [ARG]', "Capital income range, e.g. 25000-30000") do |v|
    parts = v.split('-')
    options[:capital_income_range] = (parts[0].to_f..parts[1].to_f)
  end
  opts.on('--capital-income-step [ARG]', "Capital income step, e.g. 1000") do |v|
    options[:capital_income_step] = v.to_f
  end
  opts.on('-h', '--help', 'Display this help') do
    puts opts
    exit
  end
  puts opts
end.parse!

puts options

def tax_for(options = {})
  gross_income = options.fetch(:gross_income)
  capital_income = options.fetch(:capital_income, 0)
  entrepreneur = options.fetch(:entrepreneur, false)
  mech = Mechanize.new
  page = mech.get('http://prosentti.vero.fi/VPL2015/Sivut/Aloitus.aspx')
  # Page 1
  page_1 = mech.click(page.link_with(text: /Veroprosenttilaskuri 2015/))
  form_1 = page_1.form_with(action: 'Henkilotiedot.aspx')
  form_1.field_with(name: "ddKotikunta").option_with(text: "Espoo").click
  form_1.field_with(name: "ddSeurakunta").option_with(text: "ei kirkollisverovelvollinen").click
  form_1.field_with(name: "ddSyntymavuosi").value = "1976"
  form_1.field_with(name: "ddPuoliso").value = "Kyllä"
  form_1.field_with(name: "tbYhteishuoltoLapset").value = "2"
  form_1.field_with(name: "tbLapset").value = "2"
  # Page 2
  page_2 = form_1.submit(form_1.button_with(name: "btnJatka"))
  fail page_2.body unless page_2.uri.to_s == 'http://prosentti.vero.fi/VPL2015/Sivut/TulotJaVahennykset.aspx'
  form_2 = page_2.form_with(action: 'TulotJaVahennykset.aspx') do |f|
    # Bruttoinkomster
    f.field_with(name: "tbPaatoimiArvioTulo").value = gross_income.to_s.gsub('.', ',')
    # Dividender
    # f.field_with(name: "tbOsingotJulkNotPotArvioTulo").value = capital_income.to_s.gsub('.', ',')
    # Övrig kapitalinkomster
    f.field_with(name: "tbVuokratulotJaTappiotVuoratulotOsakehuoneistoista").value = capital_income.to_s.gsub('.', ',')
    # Entrepreneurs need to include "FöPL- eller LFöPL-arbetsinkomst (YEL)":
    if entrepreneur
      f.field_with(name: "tbShJaPaivarahamaksunTiedotYelTyotulo").value = gross_income.to_s.gsub('.', ',')
      f.field_with(name: "tbShJaPaivarahamaksunTiedotTyotuloillaKorvattavaYpalkka").value = gross_income.to_s.gsub('.', ',')
    end
  end
  # Page 3
  page_3 = form_2.submit(form_2.button_with(name: "btnJatka"))
  base = Float(page_3.at('#riviPerusprosentti').at('#neljassoluPerusprosentti').text.gsub(',', '.'))
  additional = Float(page_3.at('#riviLisaprosentti').at('#neljassoluLisaprosentti').text.gsub(',', '.'))
  [ base, additional ]
#rescue => e
  #puts e
  #binding.pry
end

CSV.open("taxes.csv", "w") do |csv|
  cols = [ "bruttoinkomster", "kapitalinkomster", "grundprocent", "tilläggsprocent" ]
  csv << cols
  options.fetch(:gross_income_range).step(options.fetch(:gross_income_step)).each do |gross_income|
    options.fetch(:capital_income_range).step(options.fetch(:capital_income_step)).each do |capital_income|
      taxes = tax_for(gross_income: gross_income, capital_income: capital_income)
      row = [ gross_income, capital_income, taxes ].flatten
      puts Hash[cols.zip row]
      csv << row
    end
  end
end
```
    

Open taxes.csv and think about what you're doing.

