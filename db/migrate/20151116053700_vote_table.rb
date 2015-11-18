class VoteTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :username
      t.string :vote
      t.timestamps
    end
  end
end
