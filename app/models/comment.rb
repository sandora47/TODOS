# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
  # validates :username, presence: true, length: { minimum: 3 }
  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
