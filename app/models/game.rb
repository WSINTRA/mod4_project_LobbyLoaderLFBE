class Game < ApplicationRecord

	has_many :parties
	has_many :coverimages
	has_many :screenshots
	has_many :websites

	has_many :gamegenres
	has_many :genres, through: :gamegenres

	has_many :ownedgames
	has_many :users, through: :ownedgames

	has_many :gamemodes
	has_many :modes, through: :gamemodes

	has_many :releases
	has_many :platforms, through: :releases

	has_many :gamekeywords
	has_many :keywords, through: :gamekeywords

	def add_screenshots (screenshot_array)
		screenshot_array.each do |screenshot|
			front_of_url = "https://images.igdb.com/igdb/image/upload/t_"
			end_of_url = ".jpg"
			Screenshot.create(original_url: front_of_url+"original/"+screenshot["image_id"]+end_of_url, large_url: front_of_url+"720p/"+screenshot["image_id"]+end_of_url, image_id: screenshot["image_id"], game: self)
		end
	end

	def add_coverimage (cover)
		puts cover
		front_of_url = "https://images.igdb.com/igdb/image/upload/t_"
		end_of_url = ".jpg"
		if(cover.is_a? Hash)
			Coverimage.create(original_url: front_of_url+"original/"+"#{cover["image_id"]}"+end_of_url, large_url: front_of_url+"720p/"+"#{cover["image_id"]}"+end_of_url, image_id: "#{cover["image_id"]}", game: self)
		else
			Coverimage.create(original_url: "https://www.nocowboys.co.nz/images/v3/no-image-available.png", large_url: "https://www.nocowboys.co.nz/images/v3/no-image-available.png", game:self)
		end
	end

	def add_releases (release_date_array)
		release_date_array.each do |release|
			Release.create(date: release["human"], platform: Platform.find_by(igdb_id: release["platform"]), game: self)
		end
	end

	def add_websites (website_array)
		website_array.each do |website|
			#to replace .com
			#new_name = website["url"][(website["url"].index("//")+2)..(website["url"].index(".com")-1)]	
			Website.create(name: website["url"], url: website["url"], game: self)
		end
	end

	def add_modes (mode_array)
		mode_array.each do |mode|
			self.modes << Mode.find_by(igdb_id: mode["id"])
		end
	end

	def add_genres (genre_array)
		genre_array.each do |genre|
			self.genres << Genre.find_by(igdb_id: genre["id"])
		end
	end

	def add_keywords (keyword_array)
		keyword_array.each do |keyword|
			self.keywords << Keyword.find_by(igdb_id: keyword["id"])
		end
	end

end
