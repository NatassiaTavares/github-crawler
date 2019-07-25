class AddLoginToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :login, :string
  end
end
