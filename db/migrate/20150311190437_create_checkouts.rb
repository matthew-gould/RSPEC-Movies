class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false
    end
  end
end
