class CreateVats < ActiveRecord::Migration[5.0]
  def change
    create_table :vats do |t|
      t.string :description
      t.decimal :percentage

      t.timestamps
    end
    
    
    
  end
end
