# frozen_string_literal: true

class GoalApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
