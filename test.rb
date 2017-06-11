require_relative "scanthis.rb"
require 'json'

scanthis = Github_get.new
# puts "#{scanthis.run("issues")}"
puts JSON.pretty_generate(scanthis.run("milestones"))