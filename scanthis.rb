require 'github_api'
require 'json'

class Github_get
	def initialize

		@github = Github.new :basic_auth => 'ilkejav:githubIlkejav5',
				:user => 'ilkejav',
				:repo => 'castlestory-game'

	end

	def github ; return @github end

	def run param = nil
		
		begin

			case param
			when "login"
				return github

			when "issues"
				info = Array.new
				list = github.issues.list org:'Sauropod-Studio', state:'all', filter:'all', page:"0", per_page:'10'
				list.each do |resource|
					unless resource[:pull_request]
						info.push({
							:title => resource[:title],
							:number => resource[:number],
							:state => resource[:state]
						})
					end

				end
				return info

			when "pull_requests"
				info = Array.new
				list = github.issues.list org:'Sauropod-Studio', state:'all', filter:'all', page:"0", per_page:'10'
				list.each do |resource|
					if resource[:pull_request]
						info.push({
							:title => resource[:title],
							:number => resource[:number],
							:state => resource[:state]
						})
					end

				end
				return info

			when "milestones"
				return github.issues.milestones.list org:'Sauropod-Studio'

			when "collaborators"
				return github.repos.collaborators.list org:'Sauropod-Studio'
			end
		
		rescue Github::Error::GithubError => e
		  puts e.message
		  if e.is_a? Github::Error::ServiceError
		    # handle GitHub service errors such as 404
		  elsif e.is_a? Github::Error::ClientError
		    # handle client errors e.i. missing required parameter in request
		  end
		end

	end
end
