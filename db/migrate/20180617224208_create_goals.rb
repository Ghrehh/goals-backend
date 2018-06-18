class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.belongs_to :user, index: true
      t.datetime :due_date
      t.string :name, null: false

      t.timestamps
    end
  end
end
