class AddDetailsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :price, :decimal
    add_column :books, :date, :datetime
    add_column :books, :author, :string
  end
end
