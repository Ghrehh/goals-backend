# frozen_string_literal: true

module Fields
  GoalField = GraphQL::Field.define do
    type Types::GoalType

    argument :auth, Types::AuthInput
    argument :goalId, !types.Int

    resolve ->(obj, args, ctx) {
      Auth.authorized_user_for(**args[:auth].to_h)&.goals&.find(args[:goalId])
    }
  end
end
