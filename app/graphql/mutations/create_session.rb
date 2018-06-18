# frozen_string_literal: true

module Mutations
  class CreateSession < GraphQL::Schema::Mutation
    null false

    argument :name, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(name:, password:)
      Auth.new_session(name: name, password: password)
    end
  end
end
