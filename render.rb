#
# Script is used for rendering markdown.
#
# $ ruby render.rb
#
require 'pg'
require 'erb'
require 'logger'
require 'yaml'
require 'ostruct'

LOG = Logger.new($stdout)
SNIPPET_TEMPLATE = File.read('src/index.html.erb')

def render_erb(template, vars)
  ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
end

def render_snippet(vars)
  render_erb(SNIPPET_TEMPLATE, vars)
end

def replace_non_alphanumeric_with_dash(str)
  regex = /[^a-zA-Z0-9]+/
  str&.gsub(regex, '-')&.gsub(/-+/, '-')
end

def pg_array_to_a(text)
  text&.gsub(/^\{(.*)\}$/, '\1')&.gsub(/\ANULL\z/, '')&.split(',')&.compact
end

def render_snippets
  Dir['src/snippets/**.md'].each do |markdown_file|
    markdown = File.read(markdown_file)
    front_matter_regex = /^---\s*(.*?)\s*^---\s*/m
    match = markdown.match(front_matter_regex)
    front_matter = match[1]
    front_matter = YAML.safe_load(front_matter)
    body = match.post_match
    id = front_matter['id']
    title = front_matter['title']
    markdown = front_matter['title']
    LOG.info "Rendering #{markdown_file} with front matter #{front_matter}"
    suffix = replace_non_alphanumeric_with_dash(title)
    #suffix = front_matter['id']
    html_file = "snippets/#{id}-#{suffix}.html".downcase
    html = render_snippet(
      id: id,
      title: title,
      body: body
    )
    File.write(html_file, html)
  end
end

#
# This method is used once to migrate database data to Markdown files.
#
def migrate_legacy_database_to_files
  conn = PG.connect(dbname: 'snippets', user: '', password: '')
  sql = <<~SQL
    SELECT
      s.id,
      s.title,
      CONVERT_FROM(s.body, 'UTF8') AS body,
      ARRAY_AGG(DISTINCT l.name) FILTER (WHERE l.name IS NOT NULL) AS languages,
      ARRAY_AGG(DISTINCT t.name) FILTER (WHERE t.name IS NOT NULL) AS tags
    FROM
      snippets s
    LEFT JOIN snippet_languages AS sl ON s.id=sl.snippet_id
    LEFT JOIN snippet_tags AS st ON sl.id=st.snippet_id
    LEFT JOIN tags t ON t.id=st.tag_id
    LEFT JOIN languages l ON l.id=sl.language_id
    GROUP BY 1, 2, 3
  SQL
  result = conn.exec(sql)

  # Loop through the result and print each row
  result.each do |row|
    id = row['id']
    title = row['title']
    markdown = row['body']
    languages = pg_array_to_a(row['languages'])
    tags = pg_array_to_a(row['tags'])
    front_matter = {
      'id' => id,
      'title' => title,
      'languages' => languages,
      'tags' => tags
    }.to_yaml
    markdown = <<~MD
      #{front_matter}---
      #{markdown}
    MD
    suffix = replace_non_alphanumeric_with_dash(title)
    markdown_file = "src/snippets/#{id}-#{suffix}.md".downcase
    File.write(markdown_file, markdown)
  end

  conn.close
end

# migrate_legacy_database_to_files
render_snippets
