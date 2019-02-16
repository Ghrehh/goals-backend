# frozen_string_literal: true

class Completion < ApplicationRecord
  belongs_to :goal
  validates :completed_at, presence: true
end
