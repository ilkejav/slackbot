module SlackMathbot
  module Commands
    class Scan < SlackRubyBot::Commands::Base
      command 'scan' do |client, data, _match|
        
        github = Github.new :basic_auth => 'ilkejav:githubIlkejav5',
        :user => 'ilkejav',
        :repo => 'castlestory-game'

        message = "this is the default message #{data} #{_match}"

        begin
        
          case _match.to_s.split(' ').last
           
            when "login"
              message = github

            when "issues"
              info = Array.new
              list = github.issues.list org:'Sauropod-Studio',  state:'all',  filter:'all',  page:"0",  per_page:'10'

              list.each do |resource|
                unless resource[:pull_request]
                  info.push({
                    :title => resource[:title],
                    :number => resource[:number],
                    :state => resource[:state]
                  })
                end
              end

              message = info

            when "pull_requests"
              info = Array.new
              list = github.issues.list org:'Sauropod-Studio',  state:'all',  filter:'all',  page:"0",  per_page:'10'
              
              list.each do |resource|
                if resource[:pull_request]
                  info.push({
                    :title => resource[:title],
                    :number => resource[:number],
                    :state => resource[:state]
                  })
                end
              end
              message = info

            when "milestones"
              info = ""
              # list = github.issues.list org:'Sauropod-Studio', state:'all', filter:'all', page:"0", per_page:'10', milestone: '0.9.1'
              message = github.issues.milestones.list org:'Sauropod-Studio',  state:'all', sort: 'due_date', direction: 'asc'

              # list.each do |resource|
              #   info += "#{resource[:title]} #{resource[:number]} #{resource[:state]} \n "
              # end

              # return info

            when "actions"
              message = github.issues.list.extend_with_actions org:'Sauropod-Studio',  state:'all',  filter:'all',  page:"0",  per_page:'10'

            when "members"
              info = Array.new
              list = github.orgs.members.list 'Sauropod-Studio'
              
              list.each do |resource|
                info.push({
                  :login => resource[:login]
                })
              end

              message = info
          end
        
        rescue Github::Error::GithubError => e
          message = e.message
          # if e.is_a? Github::Error::ServiceError
          #   # handle GitHub service errors such as 404
          # elsif e.is_a? Github::Error::ClientError
          #   # handle client errors e.i. missing required parameter in request
          # end
        end

          client.say(
          channel: data.channel,
          text: message.to_s
        )
      end
    end
  end
end