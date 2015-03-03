get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.new(url_address: params[:user_input])
  if @url.save
    @shorten_url = @url.shorten_url
    erb :index
  else
    erb :error
  end
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.where(shorten_url: "/#{params[:short_url]}")[0]
  @url.add_to_counter
  redirect to @url.url_address

end