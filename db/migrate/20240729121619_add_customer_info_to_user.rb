class AddCustomerInfoToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :subscription_status, :string
    add_column :users, :subscription_start_date, :datetime
    add_column :users, :subscription_end_date, :datetime
  end
end
