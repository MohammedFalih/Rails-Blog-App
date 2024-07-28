class ChangeAddressIdInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :address_id, true
  end
end
