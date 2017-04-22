class CreateVats < ActiveRecord::Migration[5.0]
  def change
    create_table :vats do |t|
      t.string :description
      t.decimal :percentage

      t.timestamps
    end
    
    Vat.create([
      {description: "geen", percentage: "0"},
      {description: "laag", percentage: "0.06"},
      {description: "hoog", percentage: "0.21"}
    ])
    
    
    remove_column :stock_articles, :vat, :float
    add_column :stock_articles, :vat_id, :integer, default: 3
    add_foreign_key :stock_articles, :vat
    
    
  end
end
