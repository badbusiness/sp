class AddGefactureerdToOrder < ActiveRecord::Migration[5.0]
  def change
      add_column :orders, :gefactureerd, :boolean, default: false
  end
end
