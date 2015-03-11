class EditUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer, null: false, default: 10
    add_column :users, :plan, :integer, null: false, default: 1
    add_column :users, :rented, :integer, null: false, default: 0
  end
end
