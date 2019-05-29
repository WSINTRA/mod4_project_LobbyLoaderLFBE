# require 'net/https'

class GamesController < ApplicationController
  skip_before_action :authorized, only: [:index]

   def create
	# http = Net::HTTP.new('api-v3.igdb.com', 80)
 #    request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
 #    request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (2);'
 #    game = JSON.parse(http.request(request).body)
   end

   def index
   games = Game.all
   render json: games
   end

   def show
   	game = Game.find(params[:id])
   	render json: game
   end

end
