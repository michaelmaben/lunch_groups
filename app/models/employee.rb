class Employee < ApplicationRecord
  belongs_to :department

  validates_presence_of :first_name, :last_name
  validates :badge_id, uniqueness: true

  scope :sales, ->(){ joins(:department).where("name = 'Sales'") }
  scope :dev, ->(){ joins(:department).where("name = 'Development'") }
  scope :random, lambda{ order('random()') }
end
