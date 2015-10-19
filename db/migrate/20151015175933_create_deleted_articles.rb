class CreateDeletedArticles < ActiveRecord::Migration
  def change
    create_table :deleted_articles do |t|
      t.string :name
      t.string :title
      t.boolean :deleted, :default => true

      t.timestamps null: false
    end
  end
end
