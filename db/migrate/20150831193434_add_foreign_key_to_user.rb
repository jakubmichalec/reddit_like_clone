class AddForeignKeyToUser < ActiveRecord::Migration
  def change
    add_foreign_key :links, :users
  end
end
