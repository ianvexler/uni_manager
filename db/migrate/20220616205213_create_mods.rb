class CreateMods < ActiveRecord::Migration[7.0]
  def change
    create_table :mods do |t|
      t.string :username
      t.string :code
      t.string :module_name
      t.integer :year

      t.timestamps
    end
  end
end
