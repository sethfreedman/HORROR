class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
    t.column :continent, :text
    t.column :country, :text
    t.column :decade, :integer
    t.column :media, :text
    t.column :genre, :text
    
    end
  end

  def self.down
    drop_table :comments
  end
end
