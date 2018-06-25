# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end