# frozen_string_literal: true

module Types
  class GoalType < GraphQL::Schema::Object
    graphql_name 'Goal'

    field :name, String, null: false
    field :id, Integer, null: false
    field :due_date, String, null: true
    field :latest_completion, Types::CompletionType, null: true
    field :completions, [Types::CompletionType], null: false
  end
end
