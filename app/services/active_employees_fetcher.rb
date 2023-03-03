class ActiveEmployeesFetcher
  def call
    Employee.includes(:employments).where(employments: { ends_on: nil })
  end
end
