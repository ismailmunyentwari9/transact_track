class CreateJoinTableCategoriesTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_transactions, id: false do |t|
      t.belongs_to :category
      t.belongs_to :transaction
    end

    add_index :categories_transactions, %i[category_id transaction_id], unique: true
    add_index :categories_transactions, %i[transaction_id category_id], unique: true
  end
end
