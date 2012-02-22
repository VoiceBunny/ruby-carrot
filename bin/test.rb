require 'ruby-carrot'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

rc = RubyCarrot::VBCarrot.new("testjorge@test.com", 85, "de52c722a40ea875ce89ae134a9ad66071144f5e")
#rc = RubyCarrot::VBCarrot.new("XXX", 0, "XXX", true)

puts "--------------------------------"
puts "Balance"
puts "--------------------------------"
puts rc.balance.to_yaml
puts "--------------------------------"
puts "All projects"
puts "--------------------------------"
puts rc.all_projects.to_yaml
puts "--------------------------------"
puts "Add Project"
puts "--------------------------------"
project = {
    script: "Test project",
    specialInstructions: "Posted from Ruby-Carrot"
}
response = rc.create_project(project)
puts response.to_yaml
id = response['project']['id']
puts id
puts "--------------------------------"
puts "Get Project"
puts "--------------------------------"
puts rc.get_project(id).to_yaml
puts "--------------------------------"
puts "Force Dispose"
puts "--------------------------------"