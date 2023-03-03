class ReportFetcher
  def self.active_employees_by_department
    Department.includes(:employments)
              .select('departments.name as department_name, COUNT(employments.employee_id) AS employee_count')
              .where(employments: { ends_on: nil } )
              .group('departments.id, department_name, employments.department_id')
  end
end
