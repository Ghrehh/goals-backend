# frozen_string_literal: true

module Types
  class AuthInput < GraphQL::Schema::InputObject
    argument :remember_token, String, required: true
    argument :user_id, Integer, required: true
  end
end
