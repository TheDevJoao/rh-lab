# frozen_string_literal: true

class DepartmentsGetter
  def call
    Department.where.not(name: [nil, ''])
  end
end
