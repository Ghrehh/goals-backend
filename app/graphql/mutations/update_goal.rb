# frozen_string_literal: true

module Mutations
  class UpdateGoal < GraphQL::Schema::Mutation
    null false

    argument :auth, Types::AuthInput, required: true
    argument :name, String, required: false
    argument :id, Integer, required: true

    field :goal, Types::GoalType, null: true

    def resolve(auth:, name:, id:)
      goal = Auth.authorized_user_for(
        **auth.to_h
      )&.goals&.find(id)

      goal.update(name: name)

      { goal: goal }
    end
  end
end
