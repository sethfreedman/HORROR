class AddMarketColumn < ActiveRecord::Migration
  def self.up
  add_column :comments, :market,:text
  end

  def self.down
  remove_column :comments, :market
  end
end
