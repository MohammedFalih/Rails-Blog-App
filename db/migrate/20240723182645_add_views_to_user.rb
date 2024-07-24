class AddViewsToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :views, :integer, default: 0
  end
end
