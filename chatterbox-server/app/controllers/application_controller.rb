class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/' do
    "Hello World"
  end

  get '/messages' do
    messages= Message.all
    messages.to_json 
  end

  get '/messages/:id' do
    messages= Message.find_by(id: params[:id]) 
    messages.to_json
  end

  post '/messages' do
    messages= Message.create(
      body: params[:body],
      username: params[:username]
      )
    messages.to_json
  end

  patch '/messages/:id' do
    messages= Message.find_by(id: params[:id])
    messages.update(
      body: params[:body],
      username: params[:username]
    )
    messages.to_json
  end

  delete '/messages/:id' do
    messages= Message.find_by(id: params[:id]) 
    messages.destroy
    messages.to_json
  end

  
  # Add routes
  
end
