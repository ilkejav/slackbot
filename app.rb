require 'sinatra'
require_relative "scanthis.rb"
require 'github_api'
require 'json'


post '/gateway' do

  message = params[:text].gsub(params[:trigger_word], '').strip

  # return respond_message message

  # action, repo = message.split('_').map {|c| c.strip.downcase }

  case message

  	when "status"
  		return respond_message "is work"
    
    when 'issues'
      scanthis = Github_get.new
      return respond_message "#{scanthis.run("issues")}"
  	
  	when 'pull_requests'
      scanthis = Github_get.new
      return respond_message "#{scanthis.run("pull_requests")}"
  	
  	else
  		return message

  end
  
end

def respond_message message
  content_type :json
  {:attachments => {:text => message} }}.to_json
end