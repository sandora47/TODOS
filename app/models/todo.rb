# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
end
