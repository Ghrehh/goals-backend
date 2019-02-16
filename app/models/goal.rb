# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  has_many :completions
  validates :name, presence: true
end
