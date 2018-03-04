class Volunteer
  attr_accessor(:name)
  attr_reader(:project_id, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end
