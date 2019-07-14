require 'sinatra'
require 'erb'

get '/' do
  erb :index
end

post '/upload' do
  if params[:file]
    path = "./images/#{params[:file][:filename]}"
    File.open(path, 'wb') do |f|
      f.write params[:file][:tempfile].read
      @mes = "アップロードyeah!"
    end
  else
    @mes = "OMG"
  end

  erb :show
end




