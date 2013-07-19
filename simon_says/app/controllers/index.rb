get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/color' do

  #Create and return a JSON object with the random cell and color given below.

  # request.xhr? # xhr = xml / http request? NOTE: if we weren't working w/ jQuery, we would be issuing a new xhr request. In that case, this line of code would be required
  cell= rand(1..9)
  color= "#" + "%06x" % (rand * 0xffffff)

  # the line below 'sends' to the server what the data type will be 
  content_type :json 
  {:cell => cell, :color => color}.to_json

end