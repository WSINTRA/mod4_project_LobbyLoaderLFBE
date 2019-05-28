require 'net/https'


# Game.destroy_all
# Genre.destroy_all

# league = Game.create(name:"League of Legends")
# overwatch = Game.create(name:"Overwatch")
# counterstrike = Game.create(name:"Counterstrike 1.6")
# maplestory = Game.create(name:"Maplestory")
# starcraft = Game.create(name:"Starcraft")

# fps = Genre.create(name:"FPS")
# br = Genre.create(name:"Battle Royale")
# rpg = Genre.create(name:"RPG")
# mmo = Genre.create(name:"MMO")
# strategy = Genre.create(name:"Strategy")


# mikey = User.create(username: "Mikey", email: "none", password: "bla")
# will = User.create(username: "Will", email: "none", password: "bla")
# dan = User.create(username: "Dan", email: "none", password: "bla")

# party_one = Party.create(user: mikey, game: league, name: "mikey's party", partysize: 5)
# party_two = Party.create(user: will, game: counterstrike, name: "will's party", partysize: 6)
# party_three = Party.create(user: mikey, game: maplestory, name: "mikey's second party", partysize: 3)

# Message.create(user:mikey, party: party_one, content: "wasssaaupppp")
# Message.create(user:mikey, party: party_one, content: "HIII")

 #      ___           ___           ___           ___           ___           ___     
 #     /\__\         /\__\         /\  \         /\  \         /\__\         /\__\    
 #    /:/ _/_       /:/ _/_        \:\  \       /::\  \       /:/ _/_       /:/ _/_   
 #   /:/ /\  \     /:/ /\__\        \:\  \     /:/\:\__\     /:/ /\__\     /:/ /\  \  
 #  /:/ /::\  \   /:/ /:/ _/_   _____\:\  \   /:/ /:/  /    /:/ /:/ _/_   /:/ /::\  \ 
 # /:/__\/\:\__\ /:/_/:/ /\__\ /::::::::\__\ /:/_/:/__/___ /:/_/:/ /\__\ /:/_/:/\:\__\
 # \:\  \ /:/  / \:\/:/ /:/  / \:\~~\~~\/__/ \:\/:::::/  / \:\/:/ /:/  / \:\/:/ /:/  /
 #  \:\  /:/  /   \::/_/:/  /   \:\  \        \::/~~/~~~~   \::/_/:/  /   \::/ /:/  / 
 #   \:\/:/  /     \:\/:/  /     \:\  \        \:\~~\        \:\/:/  /     \/_/:/  /  
 #    \::/  /       \::/  /       \:\__\        \:\__\        \::/  /        /:/  /   
 #     \/__/         \/__/         \/__/         \/__/         \/__/         \/__/

###############
#genre name is : Simulator, 13 
simulator = Genre.create(name:"Simulator", igdb_id: 13)

#genre name is : Tactical, 24 
Tactical = Genre.create(name:"Tactical", igdb_id: 24)

#genre name is : Quiz/Trivia, 26 
Trivia = Genre.create(name:"Trivia", igdb_id: 26)

#genre name is : Fighting, 4 
Fighting = Genre.create(name:"Fighting", igdb_id: 4)

#genre name is : Strategy, 15 
Strategy = Genre.create(name:"Strategy", igdb_id: 15)

#genre name is : Adventure, 31 
Adventure = Genre.create(name:"Adventure", igdb_id: 31)

#genre name is : Role-playing (RPG), 12 
RPG = Genre.create(name:"RPG", igdb_id: 12)

#genre name is : Shooter, 5 
Shooter = Genre.create(name:"Shooter", igdb_id: 5)

#genre name is : Music, 7 
Music = Genre.create(name:"Music", igdb_id: 7)

#genre name is : Indie, 32 
Indie = Genre.create(name:"Indie", igdb_id: 32)

#genre name is : Turn-based strategy (TBS), 16
TBS = Genre.create(name:"TBS", igdb_id: 16) 

#genre name is : Pinball, 30 
Pinball = Genre.create(name:"Pinball", igdb_id: 30)

#genre name is : Puzzle, 9 
Puzzle = Genre.create(name:"Puzzle", igdb_id: 9)

#genre name is : Real Time Strategy (RTS), 11
RTS = Genre.create(name:"RTS", igdb_id: 11) 

#genre name is : Hack and slash/Beat 'em up, 25 
beatEmUp = Genre.create(name:"beatEmUp", igdb_id: 25)

#genre name is : Platform, 8 
PLITFORM = Genre.create(name:"Platform", igdb_id: 8)

#genre name is : Racing, 10 
Racing = Genre.create(name:"Racing", igdb_id: 10)

#genre name is : Sport, 14 
Sport = Genre.create(name:"Sport", igdb_id: 14)

#genre name is : Arcade, 33 
Arcade = Genre.create(name:"Arcade", igdb_id: 33)

#genre name is : Point-and-click, 2 
pointAndClick = Genre.create(name:"pointAndClick", igdb_id: 2)

################

http = Net::HTTP.new('api-v3.igdb.com', 80)
offset = 0

while offset <= 150  do
	request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/platforms'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
	request.body = "fields *; limit 50; offset #{offset};"
	platformIE = JSON.parse(http.request(request).body)
	platformIE.each do |platform| 
		Platform.create(name: platform["name"], alt_name: platform["alternative_name"], slug_name: platform["slug"], abbreviation: platform["abbreviation"], igdb_id: platform["id"])
	end
	offset += 50
end



game_field = "fields *, screenshots.*, genres.name, cover.*, player_perspectives.*, websites.*, game_modes.*, age_ratings.*, keywords.*, platforms.*, release_dates.*; "

Genre.all.each do |genre|
	offset = 0
	limit = 10 #change to 50 for more 
	# while offset <= 150  do
		request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
		request.body = game_field + "sort popularity desc; limit #{limit}; offset #{offset}; where genres = (#{genre.id});"
		all_games_for_current_genre = JSON.parse(http.request(request).body)
		all_games_for_current_genre.each do |game_from_db|
			game = Game.create(name: game_from_db["name"], summary: game_from_db["summary"], slug_name: game_from_db["slug"])
			if(!game_from_db["keywords"].nil?)
				Keyword.createKeyword(game_from_db["keywords"])
				game.add_keywords(game_from_db["keywords"])
			end
			if(!game_from_db["game_modes"].nil?)
				Mode.createMode(game_from_db["game_modes"])
				game.add_modes(game_from_db["game_modes"])
			end

			game_from_db["websites"].nil? ? () : game.add_websites(game_from_db["websites"])
			game_from_db["screenshots"].nil? ? () : game.add_screenshots(game_from_db["screenshots"])
			game_from_db["cover"].nil? ? () : game.add_coverimage(game_from_db["cover"])
			game_from_db["release_dates"].nil? ? () : game.add_releases(game_from_db["release_dates"])
			game_from_db["genres"].nil? ? () : game.add_genres(game_from_db["genres"])
		# end
		# offset += 50
	end
	puts "Finished requesting genre #{genre.name}"
end


# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/platforms'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields *; limit 50; offset 50;'
# platformIE = JSON.parse(http.request(request).body)
# platformIE.each do |platform| 
# 	Platform.create(name: platform["name"], alt_name: platform["alternative_name"], slug_name: platform["slug"], abbreviation: platform["abbreviation"], igdb_id: platform["id"])
# end

# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/platforms'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields *; limit 50; offset 100;'
# platformIE = JSON.parse(http.request(request).body)
# platformIE.each do |platform| 
# 	Platform.create(name: platform["name"], alt_name: platform["alternative_name"], slug_name: platform["slug"], abbreviation: platform["abbreviation"], igdb_id: platform["id"])
# end

# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/platforms'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields *; limit 50; offset 150;'
# platformIE = JSON.parse(http.request(request).body)
# platformIE.each do |platform| 
# 	Platform.create(name: platform["name"], alt_name: platform["alternative_name"], slug_name: platform["slug"], abbreviation: platform["abbreviation"], igdb_id: platform["id"])
# end

#fifty games are requested for every Genre

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (24);'
# genre24 = JSON.parse(http.request(request).body)
# genre24.each do |game| 
# 	temp = Game.create(name: game["name"])
# 	temp.genres << Tactical

# end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (4);'
# genre4 = JSON.parse(http.request(request).body)
# genre4.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Fighting end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (26);'
# genre26 = JSON.parse(http.request(request).body)
# genre26.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Trivia end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (13);'
# genre13 = JSON.parse(http.request(request).body)
# genre13.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << simulator end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (15);'
# genre15 = JSON.parse(http.request(request).body)
# genre15.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Strategy end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (31);'
# genre31 = JSON.parse(http.request(request).body)
# genre31.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Adventure end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (12);'
# genre12 = JSON.parse(http.request(request).body)
# genre12.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << RPG end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (5);'
# genre5 = JSON.parse(http.request(request).body)
# genre5.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Shooter end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (7);'
# genre7 = JSON.parse(http.request(request).body)
# genre7.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Music end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (32);'
# genre32 = JSON.parse(http.request(request).body)
# genre32.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Indie end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (16);'
# genre16 = JSON.parse(http.request(request).body)
# genre16.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << TBS end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (30);'
# genre30 = JSON.parse(http.request(request).body)
# genre30.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Pinball end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (9);'
# genre9 = JSON.parse(http.request(request).body)
# genre9.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Puzzle  end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (11);'
# genre11 = JSON.parse(http.request(request).body)
# genre11.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << RTS end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (25);'
# genre25 = JSON.parse(http.request(request).body)
# genre25.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << beatEmUp end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (8);'
# genre8 = JSON.parse(http.request(request).body)
# genre8.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Platform end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (10);'
# genre10 = JSON.parse(http.request(request).body)
# genre10.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Racing end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (14);'
# genre14 = JSON.parse(http.request(request).body)
# genre14.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Sport end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (33);'
# genre33 = JSON.parse(http.request(request).body)
# genre33.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << Arcade end

# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'b01a54f483243e112f091be108505cce'})
# request.body = 'fields alternative_names,cover,genres,name,popularity; sort popularity desc; limit 50; where genres = (2);'
# genre2 = JSON.parse(http.request(request).body)
# genre2.each do |game| temp = Game.create(name: game["name"])
# 	temp.genres << pointAndClick end




puts "------------------\n|                |\n|  DONE SEEDING  |\n|                |\n------------------"

