# Views for Review class
# Index
get "/users/:user_id/reviews" do #made a nested route
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
   @user = User.find(params[:user_id])
   @all_reviews = @user.reviews
  erb :"reviews/review_index"
end


# New
get "/users/:user_id/new_review" do #made a nested route
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
   @user = User.find(params[:user_id])
  erb :"reviews/review_new"
end


# Create
post "/users/:user_id/create_review" do #made nested route
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @review = Review.create({content: params[:content], user_id: params[:user_id]})
  erb :"reviews/review_create"
end


# Edit
get "/reviews/:id/edit" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @review = Review.find(params[:id])
  erb :"reviews/review_edit"
end

# Update
post "/reviews/:id/update" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @review = Review.find(params[:id])
  @review.update_attributes({content: params[:content]})
  erb :"reviews/review_update"
end

# Delete
get "/reviews/:id/delete" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  Review.find(params[:id]).delete
  erb :"reviews/review_delete"
end

# Show
get "/reviews/:id" do
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @review = Review.find(params[:id])
  erb :"reviews/review_show"
end
