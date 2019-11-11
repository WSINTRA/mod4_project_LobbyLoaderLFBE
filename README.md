## README

# Lobby Loader
MVP
An advanced game lobby app; a user registers and tells the system what games they own. 
Once a user is registered they can login and create a new party. 
Other users can then join the party and send messages to the party.
A party will have an upper limit of members, once that is reached a notification will be sent to all members of the party to tell them to commence the game.
The creator of the party will be able to add / remove members. 
A user with the same game can add themselves to the party. 

### Notes
Backend server built using Rails for the lobby loader front end React project.

```
git clone https://github.com/WSINTRA/mod4_project_LobbyLoaderLFBE
cd mod4_project_LobbyLoaderLFBE
bundle install
rails db:create && db:migrate
rails db:seed
rails s -p 3050

```
Once server is up and running you can then start the front end app.
https://github.com/WSINTRA/lobby_loader
