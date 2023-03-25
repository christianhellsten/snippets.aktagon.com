---
id: '811'
title: Testing Whenever with Rspec
languages:
- ruby
tags:
---
```ruby
require 'spec_helper'
require 'whenever'

describe Whenever do
  def gen_cron(stage:)
    x = Whenever::JobList.new(
      file: Rails.root.join("config", "schedule.rb").to_s,
      set: "stage=#{stage}"
    ).generate_cron_output
    x.gsub(Dir.pwd, "")
  end

  it "generates correct cron configuration for each stage" do
    [ :qa, :production ].each do |stage|
      expected = File.read("spec/fixtures/#{stage}.cron")
      cron = gen_cron(stage: stage)
      # NOTE: Uncomment to update expected cron configuration
      #File.open("spec/fixtures/#{stage}.cron", "w") {|x| x << cron }
      assert_equal expected.strip, cron.strip
    end
  end
end
```
