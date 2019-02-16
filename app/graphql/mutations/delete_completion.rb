# frozen_string_literal: true

module Mutations
  class DeleteCompletion < GraphQL::Schema::Mutation
    null true

    argument :auth, Types::AuthInput, required: true
    argument :completion_id, Int, required: true

    field :goals, [Types::GoalType], null: true

    def resolve(auth:, completion_id:)
      user = Auth.authorized_user_for(**auth.to_h)
      completion = Completion.find(completion_id)
      raise Error unless completion.goal.user.id == user.id

      completion.delete

      { goals: user.goals }
    end
  end
end
