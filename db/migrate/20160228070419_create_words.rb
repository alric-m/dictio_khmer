class CreateWords < ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.string  :phonetic
      t.string  :word_type

      t.timestamps null: false
    end
    Word.create_translation_table! definition: :string
  end

  def down
    drop_table :words
    Word.drop_translation_table!
  end
end
