class DropAddressesTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :addresses, force: :cascade
  end
end
