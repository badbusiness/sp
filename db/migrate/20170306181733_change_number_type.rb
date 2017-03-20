class ChangeNumberType < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :number, :string, 'integer USING CAST(column_name AS integer)'
  end
end
