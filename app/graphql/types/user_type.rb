# frozen_string_literal: true

module Types
  class UserType < GraphQL::Schema::Object
    graphql_name 'User'

    field :name, String, null: false
    field :id, Integer, null: false
  end
end
