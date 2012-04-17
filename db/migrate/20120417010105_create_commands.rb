class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :command
      t.string :description

      t.timestamps
    end
  end
end
