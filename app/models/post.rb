class Post < ApplicationRecord
  # talks to the "posts" table
  belongs_to :places
  validates_presence_of :title
  validates_presence_of :posted_on
  validates_presence_of :place_id
  validates_presence_of :created_at
  validates_presence_of :updated_at
end
