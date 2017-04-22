class CreateOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lines do |t|
      t.references :stock_article, foreign_key: true
      t.references :order, foreign_key: true
      t.string :type
      t.decimal :amount

      t.timestamps
    end
  end
end
