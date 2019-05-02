Rails.application.routes.draw do
  post "/gql", to: "graphql#execute"
  resource :health_check, only: [:show]
end
