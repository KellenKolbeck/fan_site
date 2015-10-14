class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :user, :string
      t.column :content, :string
      t.timestamps
    end
  end
end
