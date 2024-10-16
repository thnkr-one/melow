class CreateTaggings < ActiveRecord::Migration[8.0]
  def change
    create_table :taggings, id: :uuid do |t|
      t.references :tag, null: false, foreign_key: true, type: :uuid
      t.references :taggable, polymorphic: true, type: :uuid
      t.timestamps
    end
  end
end
