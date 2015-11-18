# THIS PAGE DEFINES THE LOGIC/ROUTES

DATABASE = {
  'jennifertigner' => '1234'
}

# LOGIN
get '/' do
  @username = session['username']
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  session['username_given'] = params['username']
  userexist = DATABASE[params['username']]
  if userexist && userexist == params['password'] # BCrypt::Password.new(userexist) == params['password']
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
    artist:      params[:artist],
    song_title:  params[:song_title],
    url:         params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end
