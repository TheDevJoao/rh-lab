# frozen_string_literal: true

Rails.logger.debug '...Creating Positions...'
Position.create(name: 'QR Analyst')
Position.create(name: 'Engineer')
Position.create(name: 'HR Assistant')

Rails.logger.debug '...Creating Employees...'
employees = 10.times.map { Employee.create(name: FFaker::NameBR.name) }

Rails.logger.debug '...Creating Departments...'
Department.create(name: 'HR', manager_id: employees.sample.id)
Department.create(name: 'Engineering', manager_id: employees.sample.id)

def get_employment_data(active_employment)
  if active_employment
    starts_on = FFaker::Time.between(active_employment.starts_on + 1.day, Time.zone.today).to_date
    active_employment.update(ends_on: starts_on - 1.day)
    reason = Employment.reasons[:promote]
    salary = 10_000
  else
    starts_on = FFaker::Time.between(Time.zone.yesterday - 2.years, Time.zone.today).to_date
    reason = Employment.reasons[:hire]
    salary = 2200
  end
  { starts_on:, reason:, salary: }
end

Rails.logger.debug '...Creating Employments...'
2.times do
  Employee.all.each do |employee|
    active_employment = employee.employments.find_by(ends_on: nil)

    employment_data = get_employment_data(active_employment)

    department = Department.all.sample
    Employment.create(
      employee_id: employee.id,
      department_id: department.id,
      position_id: Position.all.sample.id,
      salary: employment_data[:salary],
      registration: FFaker::Number.number(digits: 2),
      starts_on: employment_data[:starts_on],
      ends_on: nil,
      reason: employment_data[:reason]
    )
  end
end

Rails.logger.debug '...Creating Projects...'
2.times do
  Project.create(
    name: FFaker::Company.bs,
    starts_on: FFaker::Time.between(Time.zone.yesterday, Time.zone.yesterday - 1.year).to_date,
    ends_on: FFaker::Time.between(Time.zone.today, Time.zone.today + 4.years).to_date,
    budget: rand(100_000..150_000),
    spent: rand(0..200_000)
  )
end

Rails.logger.debug '...Creating Assignments...'
10.times do
  Assignment.create(
    employee_id: employees.sample.id,
    project_id: Project.pluck(:id).sample,
    starts_on: FFaker::Time.between(Time.zone.yesterday, Time.zone.yesterday - 2.months).to_date,
    ends_on: FFaker::Time.between(Time.zone.today, Time.zone.today + 2.months).to_date
  )
end
