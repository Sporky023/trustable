class AddHappenedAtToClaims < ActiveRecord::Migration
  def self.up
    add_column :claims, :happened_at, :datetime
  end

  def self.down
    remove_column :claims, :happened_at
  end
end
