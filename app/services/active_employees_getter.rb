class ActiveEmployeesGetter
  def call
    Employee.joins(:employments).where('employments.ends_on IS NULL')
  end
end
