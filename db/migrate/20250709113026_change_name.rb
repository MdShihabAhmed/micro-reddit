class ChangeName < ActiveRecord::Migration[8.0]
  def change
    rename_column :comments, :comment, :body
  end
end
