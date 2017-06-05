require 'sinatra'
require_relative "scanthis.rb"
require 'github_api'
require 'json'


post '/gateway' do
  github = Github.new
  message = params[:text].gsub(params[:trigger_word], '').strip

  action, repo = message.split('_').map {|c| c.strip.downcase }
  # repo_url = "https://api.github.com/Sauropod-Studio/castlestory-game"

  case action

  	when "hello"
  		return "byebye"
    
    when 'issues'
      scanthis = Github_get.new
      return JSON.pretty_generate(
      	scanthis.run("issues")
      	)
  	
  	when 'pull_requests'
      scanthis = Github_get.new
      return JSON.pretty_generate(
      	scanthis.run("pull_requests")
      	)
  end
  # return respond_message "#{message}  #{params[:channel_name]}  #{params[:team_id]}  #{params[:timestamp]}"
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end