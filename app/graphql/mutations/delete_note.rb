# frozen_string_literal: true

module Mutations
  class DeleteNote < GraphQL::Schema::Mutation
    null true

    argument :auth, Types::AuthInput, required: true
    argument :note_id, Int, required: true

    field :goal, Types::GoalType, null: true

    def resolve(auth:, note_id:)
      user = Auth.authorized_user_for(**auth.to_h)
      note = Note.find(note_id)
      goal = note.goal
      raise Error unless goal.user.id == user.id

      note.delete

      { goal: goal }
    end
  end
end
