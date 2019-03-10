# frozen_string_literal: true

module Types
  class NoteType < GraphQL::Schema::Object
    graphql_name 'Note'

    field :id, Integer, null: false
    field :body, String, null: false
    field :date, GraphQL::Types::ISO8601DateTime, null: false
  end
end
