class AddCoordinatesToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :x_mobil, :integer, default: 1000
    add_column :stories, :y_mobil, :integer, default: 200
    add_column :stories, :gravity, :string, default: "south"
  end
end
