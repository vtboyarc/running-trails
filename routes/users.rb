# Views for User class
# Index
get "/users/index" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @all_users = User.all 
  erb :"users/user_index"
end

# New
get "/users/new" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  erb :"users/user_new"
end

# Create
post "/users/create" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @user = User.create({name: params[:name]})
  erb :"users/user_create"
end

# Edit
get "/users/:id/edit" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @user = User.find(params[:id])
  erb :"users/user_edit"
end

# Update
post "/users/:id/update" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @user = User.find(params[:id])
  @user.update_attributes({name: params[:name]})
  erb :"users/user_update"
end

# Delete
get "/users/:id/delete" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  User.find(params[:id]).delete
  erb :"users/user_delete"
end

# Show
get "/users/:id" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @user = User.find(params[:id])
  erb :"users/user_show"
end