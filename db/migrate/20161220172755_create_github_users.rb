class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.string :name
      t.string :favourite_language, array: true, default: []

      t.timestamps null: false
    end
  end
end
