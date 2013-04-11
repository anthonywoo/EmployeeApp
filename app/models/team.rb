class Team < ActiveRecord::Base
  attr_accessible :name, :member_ids
  has_many :memberships, :class_name => "TeamMembership"

  has_many :members, :through => :memberships, :source => :employee
  # goes through one of it's own associations 'memberships', in that class, there is no member association - so
  # need to specify the source

  #TODO: add supervisor_id column to team table - forgot about below association
  #belongs_to :supervisor, :class_name => "Employee"
  validates :name, :presence=> true
end
