class CreateClaims < ActiveRecord::Migration
  def self.up
    create_table :claims do |t|
      t.string :entity
      t.text :body
      t.text :sources

      t.timestamps
    end
  end

  def self.down
    drop_table :claims
  end
end
