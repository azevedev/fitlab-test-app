class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer :operation

      t.timestamps
    end
  end
end
