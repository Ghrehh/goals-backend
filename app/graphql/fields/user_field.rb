Fields::UserField = GraphQL::Field.define do
  type Types::UserType

  argument :id, !types.Int
  argument :remember_token, !types.String

  resolve ->(obj, args, ctx) {
    Auth.authorized_user_for(args[:id], args[:remember_token])
  }
end
