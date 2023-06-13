class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :replying_to_comment, optional: true, default: nil
      t.integer :replying_to_user, optional: true, default: nil
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
