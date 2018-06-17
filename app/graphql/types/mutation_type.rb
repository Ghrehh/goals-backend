# frozen_string_literal: true

module Types
  class MutationType < GraphQL::Schema::Object
    field :createSession, mutation: Mutations::CreateSession
    field :createUser, mutation: Mutations::CreateUser
  end
end
