class Project
  attr_accessor(:title)
  attr_reader(:id)

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each do |project|
      title = project['title']
      id = project['id'].to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def == another_project
    (self.title == another_project.title) & (self.id == another_project.id)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.find(id)
    found_project = nil
    Project.all.each do |project|
      if project.id == id
        found_project = project
      end
    end
    found_project
  end

  def update(attributes)
    @title = attributes[:title]
    @id = self.id
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id};")
  end

  def volunteers
    project_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    volunteers.each() do |volunteer|
      name = volunteer['name']
      project_id = volunteer['project_id'].to_i
      id = volunteer['id'].to_i
      project_volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    project_volunteers
  end
end
