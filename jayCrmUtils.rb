
require_relative 'jayUtils.rb'

module JayCRMUtils
	def self.createHeader(headerString)
		JayUtils::clearScreen
		puts "-------------------------------------------\n"
		puts "\n#{headerString}"
		puts "\n-------------------------------------------\n\n"
	end

	def self.createBackToMain
		print "\nPress any key to go back to main menu..."
		gets.chomp
	end

	def self.createChoiceFooter(resultStr, choiceStr)
		puts "\n#{resultStr}\n\n-------------------------------------------\n"
  		print "#{choiceStr} (Y/N) :"
  		choice = gets.chomp.upcase
  		
  		return choice
	end
end