class TeamMembership < ActiveRecord::Base
  belongs_to :employee
  belongs_to :team
  # attr_accessible :title, :body
end
