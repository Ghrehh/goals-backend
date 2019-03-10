# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, field: Fields::UserField
    field :goals, field: Fields::GoalsField
    field :goal, field: Fields::GoalField
    field :notes, field: Fields::NotesField
  end
end
