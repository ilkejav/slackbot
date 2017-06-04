require 'sinatra'
# require 'httparty'
require 'github_api'
require 'json'


post '/gateway' do
  github = Github.new
  message = params[:text].gsub(params[:trigger_word], '').strip

  action, repo = message.split('_').map {|c| c.strip.downcase }
  # repo_url = "https://api.github.com/Sauropod-Studio/castlestory-game"

  case action
    when 'repos'
      # resp = HTTParty.get(repo_url)
      # resp = JSON.parse resp.body
      repolist = github.repos.list user: 'ilkejav'
      respond_message "#{repolist}"
  end
  # return respond_message "#{message}  #{params[:channel_name]}  #{params[:team_id]}  #{params[:timestamp]}"
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end