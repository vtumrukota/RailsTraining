class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :title
      t.boolean :deleted, :default => false

      t.timestamps null: false
    end
  end
end
