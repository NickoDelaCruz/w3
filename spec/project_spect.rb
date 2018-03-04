require "spec_helper"

describe Project do
  describe '#title' do
    it '' do
      project = Project.new({:title => 'Placeholder', :id => nil})
      expect(project.title).to eq 'Placeholder'
    end
  end
