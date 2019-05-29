class PartymembersController < ApplicationController

	def create
   		newMember = Partymember.create(user_id: params[:user_id], party_id: params[:party_id])
   		render json: newMember
   	end

   	def leaveParty
     
        user = User.find(params[:user_id])
        result = user.partymembers.find_by(party_id: params["party_id"]).destroy
        render json: result

   	end
end
