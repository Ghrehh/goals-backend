# frozen_string_literal: true

module Mutations
  class CreateNote < GraphQL::Schema::Mutation
    null false

    argument :auth, Types::AuthInput, required: true
    argument :goal_id, Int, required: true
    argument :date, GraphQL::Types::ISO8601DateTime, required: true
    argument :body, String, required: true

    field :goal, Types::GoalType, null: false

    def resolve(auth:, goal_id:, date:, body:)
      user = Auth.authorized_user_for(**auth.to_h)
      goal = user&.goals&.find(goal_id)
      goal&.notes&.create(date: date, body: body)

      { goal: goal }
    end
  end
end
