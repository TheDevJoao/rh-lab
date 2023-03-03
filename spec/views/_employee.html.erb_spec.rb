# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '_employee.html.erb', type: :view do
  context 'when employee is present' do
    let(:employee) { create(:employee, :with_active_employment, :with_department) }

    before do
      assign(:employee, employee)

      render partial: 'employees/employee', locals: { employee: }
    end

    it "displays an employee's name" do
      expect(rendered).to have_content(employee.name)
    end

    it "displays an employee's department" do
      expect(rendered).to have_content(employee.departments.last.name)
    end

    it "displays an employee's position" do
      expect(rendered).to have_content(employee.employments.last.position.name)
    end

    it "displays an employee's salary" do
      expect(rendered).to have_content(employee.employments.last.salary)
    end

    context 'when an employee has a project' do
      it "displays a table with the employee's projects in DESC" do
        projects = employee.projects.order('starts_on DESC')
        table_data = projects.map { |project| [project.name, project.starts_on, project.ends_on] }
        expect(rendered).to have_table(table_data)
      end
    end

    context 'when an employee does not have a project' do
      it 'displays a message that the employee does not have any projects' do
        expect(rendered).to have_content('HAS NO CURRENT PROJECTS')
      end
    end
  end
end
