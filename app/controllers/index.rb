get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect "/"
  else
    "Try again!!"
  end
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect "/teams/show"
  else
    erb :login
  end
end

get '/teams/show' do
  @teams = Team.all
  if session[:user_id]
    erb :"teams/show"
  else
    redirect "/login"
  end
end

get '/teams/:team_id' do
  @team = Team.find(params[:team_id])
  if session[:user_id]
    erb :"teams/single_team"
  else
    redirect "/login"
  end
end

delete '/teams/:team_id' do
  @team = Team.find(params[:team_id])
  link = @team.id
  @team.destroy
  if request.xhr?
    content_type :json
    {link: link}.to_json
  else
    redirect "/teams/show"
  end
end

post '/teams' do
  @user = User.find_by(username: params[:team][:coach])
  @team = Team.create(name: params[:team][:name], sport: params[:team][:sport], coach: @user)
  if request.xhr?
    content_type :json
    {form: erb(:"teams/_create_team_partial", layout: false, locals: {team: @team})}.to_json
  else
    redirect "/teams/show"
  end
end

post '/teams/:team_id/players' do
  @team = Team.find(params[:team_id])
  @user = User.find_by(username: params[:player][:username])
  @membership = @user.playerships.create(team: @team)
  if request.xhr?
    puts "hey!!"
    content_type :json
    {form: erb(:"teams/_new_player_partial", layout: false, locals: {team: @team, player: @user})}.to_json
  else
    redirect "/teams/#{@team.id}"
  end
end

delete '/teams/:team_id/players/:user_id' do
  @team = Team.find(params[:team_id])
  @player = User.find(params[:user_id])
  @playership = @player.playerships.find_by(team: @team)
  @playership.destroy
  redirect "/teams/#{@team.id}"
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end






