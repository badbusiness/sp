class CreateExamples < ActiveRecord::Migration[5.0]
  def change
    drop_table :examples
    create_table :examples do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
