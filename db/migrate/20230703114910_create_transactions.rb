class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :amount
      t.integer :author_id

      t.timestamps
    end
    add_foreign_key :transactions, :users, column: :author_id
  end
end
