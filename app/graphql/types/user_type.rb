# frozen_string_literal: true

module Types
  class UserType < GraphQL::Schema::Object
    graphql_name 'User'

    field :name, String, null: false
    field :id, String, null: false
    field :goals, [Types::GoalType], null: true
  end
end
