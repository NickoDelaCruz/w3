class Volunteer
  attr_accessor(:name)
  attr_reader(:project_id, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def ==(another_volunteer)
    (self.name == another_volunteer.name) & (self.project_id == another_volunteer.project_id) & (self.id == another_volunteer.id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer['name']
      project_id = volunteer['project_id'].to_i
      id = volunteer['id'].to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.find(id)
    found_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.id == id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  def update(attributes)
    @name = attributes[:name]
    @id = self.id
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end
end
