class Mutations::CreateSession < GraphQL::Schema::Mutation
  null false

  argument :name, String, required: true
  argument :password, String, required: true

  field :token, String, null: true

  def resolve(name:, password:)
    { token: Auth.new_session(name: name, password: password) }
  end
end
