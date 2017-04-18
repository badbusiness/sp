class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_articles do |t|
      t.integer :number
      t.string :description
      t.string :specification
      
      t.timestamps
    end
  end
end
