require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @projects = Project.all
  erb(:home)
end

post('/') do
  title = params['title']
  project = Project.new({:title => title, :id => nil})
  project.save
  @projects = Project.all
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params['id'].to_i)
  @volunteers = Volunteer.all
  erb(:project)
end

post('/projects/:id') do
  @project = Project.find(params['id'].to_i)
  name = params['name']
  project_id = params['project_id']
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save
  @volunteers = Volunteer.all
  erb(:project)
end
