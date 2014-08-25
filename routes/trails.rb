# Views for Trail class

# Index
get "/" do   #get "/trails/index" do  <-this doesn't work
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @all_trails = Trail.all
  erb :"trails/trail_index"
end

# New
get "/trails/new" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  erb :"trails/trail_new"
end

# Create
post "/trails/create" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @trail = Trail.create({trail_name: params[:trail_name]})
  erb :"trails/trail_create"
end

# Edit
get "/trails/:id/edit" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @all_users = User.all
  @trail = Trail.find(params[:id])
  erb :"trails/trail_edit"
end

# Update
post "/trails/:id/update" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @trail = Trail.find(params[:id])
  @trail.update_attributes({trail_name: params[:trail_name]})
  
  # Add the users in params[:users] to this trail.
  params[:users].each do |user_id|
    @trail.users << User.find(user_id)
  end
  
  erb :"trails/trail_update"
end

# Delete
get "/trails/:id/delete" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  Trail.find(params[:id]).delete
  erb :"trails/trail_delete"
end

# Show
get "/trails/:id" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
   @user = User.find(params[:id])
  @trail = Trail.find(params[:id])
  erb :"trails/trail_show"
end

