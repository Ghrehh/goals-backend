# frozen_string_literal: true

module Types
  class CompletionType < GraphQL::Schema::Object
    graphql_name 'Completion'

    field :completed_at, GraphQL::Types::ISO8601DateTime, null: false
    field :id, Integer, null: false
  end
end
