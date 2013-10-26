class CreateGroupPurchases < ActiveRecord::Migration
  def change
    create_table :group_purchases do |t|
      t.string :name
      t.string :creatorName
      t.float :balance
      
      t.timestamps
    end
  end
end
