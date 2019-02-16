# frozen_string_literal: true

module Mutations
  class CreateCompletion < GraphQL::Schema::Mutation
    null false

    argument :auth, Types::AuthInput, required: true
    argument :goal_id, Int, required: true
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: true

    field :completion, Types::CompletionType, null: true

    def resolve(auth:, goal_id:, completed_at:)
      user = Auth.authorized_user_for(**auth.to_h)
      goal = user&.goals&.find(goal_id)
      completion = goal&.completions&.create(completed_at: completed_at)

      { completion: completion }
    end
  end
end
