class PartiesController < ApplicationController
skip_before_action :authorized, only: [:index]
	def create
		newParty = Party.create(name: params["partyName"], partysize: params["partySize"],
			description: params["partyDescription"], user_id: params["userId"],
			game_id: params["gameId"] )
        
       
		render json: newParty
	end

	def index
		all = Party.all
		render json: all
	end




end 
