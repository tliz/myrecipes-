class AddChefIdToRecipes < ActiveRecord::Migration
  def change
  	# add_column table_to_add_column, field_name, type 
  	add_column :recipes, :chef_id, :integer
  end
end
