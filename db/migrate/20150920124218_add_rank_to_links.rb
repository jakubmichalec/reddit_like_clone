class AddRankToLinks < ActiveRecord::Migration
  def change
    add_column :links, :rank, :float
  end
end
