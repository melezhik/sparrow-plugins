require "terminal-table"
require "google/cloud/datastore"

@datastore = Google::Cloud::Datastore.new project: config["project_id"]

query = @datastore.query("Book").order("title")
tasks = @datastore.run query

headings = %w{ID author title description date}

rows = []

tasks.each do |t|
  #puts t.inspect
  rows.push [ t.key.id, t["author"], t["title"], t["description"], t["publishedDate"]]
end

puts Terminal::Table.new :headings => headings, :rows => rows
