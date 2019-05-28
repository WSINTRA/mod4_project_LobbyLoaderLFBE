class PartiesController < ApplicationController

	def create
		newParty = Party.create(name: params["partyName"], partysize: params["partySize"],
			description: params["partyDescription"], user_id: params["userId"],
			game_id: params["gameId"] )
        user = User.find(params["userId"])
		render json: user
	end
end
