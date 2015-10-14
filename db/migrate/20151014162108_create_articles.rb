class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :author, :string
      t.timestamps
    end
  end
end
