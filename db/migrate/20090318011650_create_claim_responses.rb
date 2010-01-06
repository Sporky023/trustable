class CreateClaimResponses < ActiveRecord::Migration
  def self.up
    create_table :claim_responses do |t|
      t.text :body
      t.text :sources
      t.boolean :truth

      t.timestamps
    end
  end

  def self.down
    drop_table :claim_responses
  end
end
