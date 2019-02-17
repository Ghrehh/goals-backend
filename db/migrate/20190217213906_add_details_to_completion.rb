class AddDetailsToCompletion < ActiveRecord::Migration[5.1]
  def change
    add_column :completions, :details, :text
  end
end
