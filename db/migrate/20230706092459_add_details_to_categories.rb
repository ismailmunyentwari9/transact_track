class AddDetailsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :details, :string
  end
end
