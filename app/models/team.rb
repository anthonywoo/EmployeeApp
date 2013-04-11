class Team < ActiveRecord::Base
  attr_accessible :name, :member_ids
  has_many :memberships, :class_name => "TeamMembership"
  has_many :members, :through => :memberships, :source => :employee
  validates :name, :presence=> true
end
