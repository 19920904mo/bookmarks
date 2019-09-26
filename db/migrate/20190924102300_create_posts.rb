class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :url
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
