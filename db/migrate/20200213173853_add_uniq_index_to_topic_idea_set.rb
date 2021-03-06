class AddUniqIndexToTopicIdeaSet < ActiveRecord::Migration[6.0]
  def change
    TopicIdeaSet.dedupe
  	add_index :topic_idea_sets, [:topic_id, :idea_set_id], unique: true
  end
end
