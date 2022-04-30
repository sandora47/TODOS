class Post < ApplicationRecord
  validates :description, presence: true
  validates :body, presence: true, length: { minimum: 5 }
end
