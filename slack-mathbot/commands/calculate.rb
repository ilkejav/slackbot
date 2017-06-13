module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'calculate' do |client, data, _match|
        client.say(
        channel: data.channel,
        text: "bwarg"
      )
      end
    end
  end
end