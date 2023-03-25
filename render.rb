#
# $ ruby render.rb
#
require 'erb'
require 'ostruct'
require 'pg'

def render(template, vars)
  ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
end

SNIPPET_TEMPLATE = File.read('index.html.erb')

def render_snippet(vars)
  render(SNIPPET_TEMPLATE, vars)
end

# Connect to the PostgreSQL database
conn = PG.connect(dbname: 'snippets', user: '', password: '')

# Fetch all data from the table
result = conn.exec("SELECT id, title, CONVERT_FROM(body, 'UTF8') AS body FROM snippets")

def replace_non_alphanumeric_with_dash(str)
  # Replace all non-alphanumeric characters with a dash using a regular expression
  regex = /[^a-zA-Z0-9]+/
  str.gsub(regex, '-').gsub(/-+/, '-')
end

# Loop through the result and print each row
result.each do |row|
  id = row['id']
  title = row['title']
  body = row['body']
  suffix = replace_non_alphanumeric_with_dash(title)
  file = "snippets/#{id}-#{suffix}.html".downcase
  contents = render_snippet(snippet: body)

  File.write(file, contents)
  # puts file
  # puts "ID: #{row['id']}, User ID: #{row['user_id']}, Title: #{row['title']}, Body: #{row['body']}, Rendered Body: #{row['rendered_body']}, Version: #{row['version']}, Lock Version: #{row['lock_version']}, Inserted At: #{row['inserted_at']}, Updated At: #{row['updated_at']}"
  # URL
  # https://snippets.aktagon.com/snippets/332-Testing-sessions-with-Sinatra
end

# Close the database connection
conn.close

