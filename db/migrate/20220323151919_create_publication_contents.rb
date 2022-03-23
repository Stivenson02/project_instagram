class CreatePublicationContents < ActiveRecord::Migration[7.0]
  def change
    create_table :publication_contents do |t|
      t.string :file
      t.text :description
      t.integer :order
      t.string :type
      t.references :publication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
