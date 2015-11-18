class AddKeys < ActiveRecord::Migration

  def change
    add_reference :songs, :user
    add_reference :votes, :user
    add_reference :votes, :song
  end

end
