class ChangeNumberType < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :number, :string
  end
end
