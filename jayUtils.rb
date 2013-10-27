module JayUtils
	def self.clearScreen
		puts "\e[H\e[2J"
	end

	def self.getChar
	  	begin
	    	system("stty raw -echo")
	    	str = STDIN.getc
	  	ensure
	    	system("stty -raw echo")
	  	end
	  	return str.chr
	end
end