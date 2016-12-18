class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_user do |t|
      t.text :name
      t.text :favourite_language

      t.timestamps null: false
    end
  end
end
