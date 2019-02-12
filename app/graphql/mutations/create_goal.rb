# frozen_string_literal: true

module Mutations
  class CreateGoal < GraphQL::Schema::Mutation
    null false

    argument :auth, Types::AuthInput, required: true
    argument :goal_name, String, required: true

    field :goal, Types::GoalType, null: true

    def resolve(auth:, goal_name:)
      goal = Auth.authorized_user_for(
        **auth.to_h
      )&.goals&.create(name: goal_name)

      { goal: goal }
    end
  end
end
