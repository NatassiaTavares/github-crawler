class ChangeGithubIdColumnNameInOwners < ActiveRecord::Migration[6.0]
  def change
    rename_column :owners, :github_id, :external_id
  end
end
