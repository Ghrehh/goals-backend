class Types::UserType < GraphQL::Schema::Object
  graphql_name 'User'

  field :name, String, null: false
  field :id, Integer, null: false
end
