class Place < ApplicationRecord
  # talks to the "places" table
  has_many :posts
  validates_presence_of :name
  validates_presence_of :created_at
  validates_presence_of :updated_at
end
