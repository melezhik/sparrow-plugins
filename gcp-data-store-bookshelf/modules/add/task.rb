require "google/cloud/datastore"

@datastore = Google::Cloud::Datastore.new project: config["project_id"]

task = @datastore.entity "Book" do |t|
  t["title"] = config["title"]
  t["author"] = config["author"]
  t["description"] = config["description"]
  t["author"] = config["author"]
  t["publishedDate"]     = Time.now
  t.exclude_from_indexes! "description", true
end

@datastore.save task

puts task.key.id

puts


