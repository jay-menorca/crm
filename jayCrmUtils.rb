
require_relative 'jayUtils.rb'

module JayCRMUtils
	def self.createHeader(headerString)
		JayUtils::clearScreen
		puts "-------------------------------------------\n"
		puts "\n#{headerString}"
		puts "\n-------------------------------------------\n\n"
	end
end