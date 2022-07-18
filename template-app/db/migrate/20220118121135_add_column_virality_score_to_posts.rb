class AddColumnViralityScoreToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :virality_score, :integer
    add_column :posts, :recent_update, :datetime
  end
end
