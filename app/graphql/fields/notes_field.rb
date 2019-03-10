# frozen_string_literal: true

module Fields
  NotesField = GraphQL::Field.define do
    type Types::NoteType.to_list_type

    argument :auth, Types::AuthInput
    argument :goalId, !types.Int

    resolve ->(obj, args, ctx) {
      goals = Auth.authorized_user_for(**args[:auth].to_h)
        &.goals
        &.find(args[:goalId])
        &.notes
    }
  end
end
