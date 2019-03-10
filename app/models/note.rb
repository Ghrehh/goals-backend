# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :goal
  validates :date, presence: true
  validates :body, presence: true
end
