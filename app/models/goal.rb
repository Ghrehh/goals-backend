# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  has_many :completions
  has_many :notes
  validates :name, presence: true
end
