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
  erb(:home)
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

get('/projects/:id/edit') do
  @project = Project.find(params['id'].to_i)
  erb(:project_edit)
end

patch('/projects/:id') do
  title = params['title']
  @project = Project.find(params['id'].to_i)
  @project.update({:title => title})
  @volunteers = Volunteer.all
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params['id'].to_i)
  @project.delete
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params['id'].to_i)
  @project = Project.find(@volunteer.project_id)
  erb(:volunteer)
end

patch('/volunteers/:id') do
  name = params[:name]
  @volunteer = Volunteer.find(params['id'].to_i)
  @volunteer.update({:name => name})
  @project = Project.find(@volunteer.project_id)
  erb(:volunteer)
end
