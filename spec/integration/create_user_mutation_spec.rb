# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateUser do
  let(:context) { {} }
  let(:variables) { {} }
  let(:result) {
    res = GoalApiSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  }

  describe "creating a user" do
    let(:name) { "foo" }
    let(:password) { "bar" }
    let(:query_string) do
      %|
        mutation {
          createUser(
            name: #{name},
            password: #{password},
            passwordConfirmation: #{password}
          ) {
             user { name, id }
          }
        }
      |
    end

    it "returns the expected name" do
      expect(result["data"]["createUser"]["user"]["name"]).to eq(name)
    end

    it "returns a valid id" do
      # Integer() will raise if it can't convert a stirng to a valid int
      expect(
        Integer(result["data"]["createUser"]["user"]["id"])
      ).to be_instance_of(Integer)
    end
  end
end
