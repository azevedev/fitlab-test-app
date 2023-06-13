class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.text :body
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
