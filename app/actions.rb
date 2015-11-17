# THIS PAGE DEFINES THE LOGIC/ROUTES

get '/' do
  erb :index
end

# ON THE HOME PAGE, THE CLICK LEADS TO MESSAGES/INDEX
get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

# THE FORM PAGE
get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

# THE PAGE FOR EACH INDIVIDUAL SONG
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end

post '/messages' do
  @message = Message.new(
    artist:      params[:artist],
    song_title:  params[:song_title],
    url:         params[:url]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end
