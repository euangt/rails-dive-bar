class AddForeignKeyToDoses < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :doses, foreign_key: true
    add_reference :cocktails, :doses, foreign_key: true
  end
end
