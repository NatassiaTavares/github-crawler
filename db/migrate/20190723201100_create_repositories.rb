class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.integer :github_id
      t.string :name
      t.string :full_name
      t.boolean :private
      t.string :html_url
      t.text :description
      t.boolean :fork
      t.integer :open_issues
      t.integer :watchers
      t.float :score

      t.timestamps
    end
  end
end
