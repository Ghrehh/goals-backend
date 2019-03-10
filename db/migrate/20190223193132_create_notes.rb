class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.datetime :date, null: false, index: true
      t.text :body, null: false
      t.belongs_to :goal, index: true

      t.timestamps
    end
  end
end
