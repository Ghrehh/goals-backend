# frozen_string_literal: true

module Types
  class GoalInput < GraphQL::Schema::InputObject
    argument :name, String, required: true
    argument :id, Integer, required: true
  end
end
