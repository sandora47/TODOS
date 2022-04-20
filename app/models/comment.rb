# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :todo
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
  validates :username, presence: true, length: { minimum: 3 }
end
