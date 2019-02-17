# frozen_string_literal: true

module Mutations
  class DeleteGoal < GraphQL::Schema::Mutation
    null true

    argument :auth, Types::AuthInput, required: true
    argument :goal_id, Int, required: true

    field :goals, [Types::GoalType], null: true

    def resolve(auth:, goal_id:)
      user = Auth.authorized_user_for(**auth.to_h)
      goal = Goal.find(goal_id)
      raise Error unless goal.user.id == user.id

      goal.delete

      { goals: user.goals }
    end
  end
end
