class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.integer :github_id
      t.string :url
      t.string :html_url
      
      t.timestamps
    end
  end
end
