require 'sinatra'
require 'httparty'
require 'json'

post '/gateway' do
  message = params[:text].gsub(params[:trigger_word], '').strip

  # action, repo = message.split('_').map {|c| c.strip.downcase }
  # repo_url = "https://api.github.com/Sauropod-Studio/castlestory-game"

  # case action
  #   when 'issues'
  #     resp = HTTParty.get(repo_url)
  #     resp = JSON.parse resp.body
  #     respond_message "There are #{resp['open_issues_count']} open issues on castlestory-game"
  # end
  return respond_message "#{message}  #{params[:channel_name]}  #{params[:team_id]}  #{params[:timestamp]}"
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end