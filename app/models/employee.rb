class Employee < ActiveRecord::Base
  attr_accessible :name, :supervisor_id, :employee_profile_attributes, :team_ids, :photo

  has_many :team_memberships
  has_many :teams, :through => :team_memberships
  has_many :supervised_teams, :class_name => "Employee", :foreign_key => "supervisor_id" #go over this again!
  #need to specify foreign key bc it will assume supervised_teams_id, but there is no such key in Employee table

  has_many :real_supervised_teams, :class_name => "Team", :through => :team_memberships, :source => :team #go over this again!
  #need to specify source, but itll look for an association named real_suprvised_teams in team_memberships model.
  #The association is named 'team' in team_memberships model

  has_one :employee_profile, :inverse_of => :employee

  belongs_to :supervisor, :class_name => "Employee"
  #it'll look for supervisor class, but class name is actually employee

  accepts_nested_attributes_for :employee_profile

  validates :employee_profile, :name, :presence => true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "200x200>" }, 
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename",
      :default_url => ActionController::Base.helpers.asset_path('missing.png')
end

