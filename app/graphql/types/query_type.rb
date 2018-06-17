# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, field: Fields::UserField
  end
end
