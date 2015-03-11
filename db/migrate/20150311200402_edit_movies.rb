class EditMovies < ActiveRecord::Migration
  def change
    add_column :movies, :out, :boolean, null: false, default: false
    add_column :movies, :streaming, :boolean, null: false, default: false
  end
end
