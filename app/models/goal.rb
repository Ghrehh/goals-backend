# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user
  has_many :completions
  validates :name, presence: true

  def latest_completion
    completions.last
  end
end
