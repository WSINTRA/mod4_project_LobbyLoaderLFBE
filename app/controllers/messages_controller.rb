class MessagesController < ApplicationController

	skip_before_action :authorized, only: [:index]
	def index
		all = Message.all
		render json: all
	end

end
