class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,        presence: true
      t.text :catch_copy,     presence: true
      t.text :concept,        presence: true
      t.references :user, foreign_key: true
    end
  end
end
