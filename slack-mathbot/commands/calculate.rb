module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'calculate' do |client, data, _match|
        client.chat_postMessage(
        channel: data.channel,
        as_user: true,
        attachments: [
          {
            fallback: "blargh blargh blargh",
            title: "wort wort wort",
            text: "bwarg bwarg bwarg bwag bwag",
            color: '#00FF00'
          }
        ]
      )
      end
    end
  end
end