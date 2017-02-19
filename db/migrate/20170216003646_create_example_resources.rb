class CreateExampleResources < ActiveRecord::Migration[5.0]
  def change
    create_table :example_resources do |t|
      t.string :name

      t.timestamps
    end
  end
end
