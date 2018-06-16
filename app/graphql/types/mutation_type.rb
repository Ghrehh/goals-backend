class Types::MutationType < GraphQL::Schema::Object
  field :createSession, mutation: Mutations::CreateSession
  field :createUser, mutation: Mutations::CreateUser
end
