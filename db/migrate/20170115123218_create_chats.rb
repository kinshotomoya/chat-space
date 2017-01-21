class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :text
      t.string :image
      t.references :user, null: false
      t.references :group, null: false
      t.timestamps
    end
  end
end
