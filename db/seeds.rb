# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

league = Game.create(name:"League of Legends")
overwatch = Game.create(name:"Overwatch")
counterstrike = Game.create(name:"Counterstrike 1.6")
maplestory = Game.create(name:"Maplestory")
starcraft = Game.create(name:"Starcraft")

fps = Genre.create(name:"FPS")
br = Genre.create(name:"Battle Royale")
rpg = Genre.create(name:"RPG")
mmo = Genre.create(name:"MMO")
strategy = Genre.create(name:"Strategy")

mikey = User.create(username: "Mikey", email: "none", password: "bla")
will = User.create(username: "Will", email: "none", password: "bla")
dan = User.create(username: "Dan", email: "none", password: "bla")

party_one = Party.create(user: mikey, game: league, name: "mikey's party", partysize: 5)
party_two = Party.create(user: will, game: counterstrike, name: "will's party", partysize: 6)
party_three = Party.create(user: mikey, game: maplestory, name: "mikey's second party", partysize: 3)

Message.create(user:mikey, party: party_one, content: "wasssaaupppp")
Message.create(user:mikey, party: party_one, content: "HIII")






puts "------------------\n|                |\n|  DONE SEEDING  |\n|                |\n------------------"


