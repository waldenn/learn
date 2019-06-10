class TopicsController < ApplicationController
	def index
	end

	def show
		@topic = Topic.find(params[:id])
		if current_user
			@user_topics = current_user.user_topics
			@topic_action = @user_topics.find { |ut| ut.topic_id == @topic.id }
		end
	end

	def toggle_follow
		@topic = Topic.find(params[:id])
		if current_user
			@user_topics = current_user.user_topics
			@topic_action = @user_topics.find { |ut| ut.topic_id == @topic.id }
			if @topic_action
				@topic_action.destroy
			else
				@user_topics.create(topic: @topic, action: "follow")
			end
		end
		redirect_to @topic
	end
end