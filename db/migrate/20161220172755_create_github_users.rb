class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.text :name
      t.text :favourite_language

      t.timestamps null: false
    end
  end
end
