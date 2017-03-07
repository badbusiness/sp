class ChangeBackNumberType < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :number, :integer
  end
end
