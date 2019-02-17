# frozen_string_literal: true

module Types
  class MutationType < GraphQL::Schema::Object
    field :createSession, mutation: Mutations::CreateSession
    field :createUser, mutation: Mutations::CreateUser
    field :createGoal, mutation: Mutations::CreateGoal
    field :createCompletion, mutation: Mutations::CreateCompletion
    field :deleteCompletion, mutation: Mutations::DeleteCompletion
    field :deleteGoal, mutation: Mutations::DeleteGoal
  end
end
