class CreateCompletions < ActiveRecord::Migration[5.1]
  def change
    create_table :completions do |t|
      t.datetime :completed_at, null: false
      t.belongs_to :goal, index: true

      t.timestamps
    end
  end
end
