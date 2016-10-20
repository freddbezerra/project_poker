class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
