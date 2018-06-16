class Mutations::CreateUser < GraphQL::Schema::Mutation
  null false

  argument :name, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true

  field :user, Types::UserType, null: true

  def resolve(name:, password:, password_confirmation:)
    user = User.create(
      name: name,
      password: password,
      password_confirmation: password_confirmation
    )

    { user: user.valid? ? user : nil }
  end
end
