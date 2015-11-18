# THIS PAGE DEFINES THE LOGIC/ROUTES
# How should I order this? Should I have all GETS together, all POSTS together?
# Should post '/songs' do come right after get '/songs' do?

# DATABASE = {
#   'jennifertigner' => '1234'
# }

# LOGIN
get '/' do
  @username = session['username']
  erb :index
end

get '/logout' do
  session.clear
  session[:user_id] = nil
  redirect '/'
end

post '/login' do
  session['username_given'] = params['username']
  user = User.find_by(username: params['username'])
  if user && user.password == params['password'] 
  # BCrypt::Password.new(userexist) == params['password']
    session['username'] = params['username']
    @songs = Song.all
    erb :'songs/index'
  else
    redirect '/'
  end
end

# AFTER SONG ADDED, REDIRECT TO SONG WALL
get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

# ADD-A-SONG PAGE
get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

# THE PAGE FOR EACH INDIVIDUAL SONG
get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    artist: params[:artist], song_title: params[:song_title], url: params[:url])
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/votes' do
  vote = Vote.new(song_id: params[:song_id], user_id: params[:user_id])
  if vote.save
    redirect '/songs'
  else
    redirect '/songs?message=Cannot vote more than once'
  end
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  session['username_given_signup'] = params['username']
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    redirect '/songs'
  else
    erb :'/signup'
  end
end
