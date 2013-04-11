class EmployeeProfile < ActiveRecord::Base
  belongs_to :employee, :inverse_of => :employee_profile
  attr_accessible :address, :ssn
  validates :employee, :address, :ssn, :presence => true
end
