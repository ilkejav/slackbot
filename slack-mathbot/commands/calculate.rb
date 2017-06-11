module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'calculate' do |client, data, _match|
        client.say(
        	channel: data.channel, 
        	text: '5',
        	as_user: true,
        	attachments: [
        		{
		            fallback: "New ticket from Andrea Lee - Ticket #1943: Can't rest my password - https://groove.hq/path/to/ticket/1943",
		            pretext: "New ticket from Andrea Lee",
		            title: "Ticket #1943: Can't reset my password",
		            title_link: "https://groove.hq/path/to/ticket/1943",
		            text: "Help! I tried to reset my password but nothing happened!",
		            color: "#7CD197"
        		}
    		].to_json
    	)
      end
    end
  end
end