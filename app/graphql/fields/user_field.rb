# frozen_string_literal: true

module Fields
  UserField = GraphQL::Field.define do
    type Types::UserType

    argument :id, !types.Int
    argument :rememberToken, !types.String

    resolve ->(obj, args, ctx) {
      Auth.authorized_user_for(
        user_id: args[:id],
        remember_token: args[:rememberToken]
      )
    }
  end
end
