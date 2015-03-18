require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require File.join(File.dirname(__FILE__), 'environment')


configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  @link_text = "Awesome Sauce"
  erb :root
end

# welcome page
get '/hello/' do
    erb :welcome
end

# form submit
post '/hello/' do
    job = params[:job] || "Oh. I guess you don't work." 
    name = params[:name] || "Nobody" 
      if params[:name] == ""
        redirect to('/error')
      end
      
    erb :welcome, :locals => {'job' => job, 'name' => name}
end

get '/error' do
  erb :error
end

get '/root' do
  erb :root
end




