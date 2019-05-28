class PartymembersController < ApplicationController

	def create
   		newMember = Partymember.create(user_id: params[:user_id], party_id: params[:party_id])
   		render json: newMember
   	end

   	def leaveParty
        
   	end
end
