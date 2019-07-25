class AddOwnerIdToRepositories < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :owner_id, :integer
  end
end
