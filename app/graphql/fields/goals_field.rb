# frozen_string_literal: true

module Fields
  GoalsField = GraphQL::Field.define do
    type Types::GoalType.to_list_type

    argument :auth, Types::AuthInput

    resolve ->(obj, args, ctx) {
      Auth.authorized_user_for(**args[:auth].to_h)
        &.goals
        &.order(created_at: :desc)
    }
  end
end
