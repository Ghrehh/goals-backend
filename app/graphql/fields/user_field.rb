Fields::UserField = GraphQL::Field.define do
  type Types::UserType

  argument :id, !types.Int
  argument :remember_token, !types.String

  resolve ->(obj, args, ctx) {
    Auth.authorized_user_for(
      user_id: args[:id],
      remember_token:  args[:remember_token]
    )
  }
end
