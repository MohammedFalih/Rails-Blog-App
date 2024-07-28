class RenameDispalyInNavInCategories < ActiveRecord::Migration[7.2]
  def change
    rename_column :categories, :dispaly_in_nav, :display_in_nav
  end
end
