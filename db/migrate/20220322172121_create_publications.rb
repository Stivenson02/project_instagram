class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.string :publication_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
