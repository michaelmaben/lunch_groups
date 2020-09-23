class Employee < ApplicationRecord
  belongs_to :department

  scope :sales, ->(){ joins(:department).where("name = 'Sales'") }
  scope :dev, ->(){ joins(:department).where("name = 'Development'") }
  scope :random, lambda{ order('random()') }
end
