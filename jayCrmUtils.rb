
require_relative 'jayUtils.rb'

class SearchStrategy
	def search(key, contacts)
	end
end

class FirstNameSearch < SearchStrategy
	def search(key, contacts)
		key = key.capitalize
		results = Array.new
		contacts.each do |a|
			if a.firstName.include? key
				results << a
			end
		end
		return results
	end
end

class LastNameSearch < SearchStrategy
	def search(key, contacts)
		key = key.upcase
		results = Array.new
		contacts.each do |a|
			if a.lastName.include? key
				results << a
			end
		end
		return results
	end
end

class EmailSearch < SearchStrategy
	def search(key, contacts)
		results = Array.new
		contacts.each do |a|
			if a.email.include? key
				results << a
			end
		end
		return results
	end
end

class NotesSearch < SearchStrategy
	def search(key, contacts)
		results = Array.new
		contacts.each do |a|
			if a.note.include? key
				results << a
			end
		end
		return results
	end
end

module JayCRMUtils
	OPT1_HEADER = "Add A Contact"
	
	OPT3_HEADER = "Delete Contact Details"
	OPT3_INSTRUCTION1 = "Press the number [X] of the contact you want to delete"

	OPT4_HEADER = "Displaying All Contacts"

	OPT5_HEADER = "Displaying Contact Details"
	OPT5_INSTRUCTION1 = "Press the number [X] of the contact you wish the details displayed"

	OPT2_INSTRUCTION1 = "Press the number [X] of the contact you want to modify"
	OPT2_INSTRUCTION2 = "Please enter the no. attribute [X] you wish to Modify"
	OPT2_HEADER = "Edit Contact Details"

	OPT6_HEADER = "Displaying Contacts by Attribute"
	OPT6_INSTRUCTION1 = "Please enter the no. attribute [X] you wish to use to retrieve contacts"
	OPT6_INSTRUCTION2 = "Please enter the search value you wish to use to retrieve contacts: "

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
		puts "#{resultStr}\n\n-------------------------------------------\n"
  		print "#{choiceStr} (Y/N) :"
  		choice = JayUtils.getChar.upcase
  		return choice
	end

	def self.getChoiceNum
		selectedVal = (JayUtils::getChar).to_i
		return selectedVal 
	end

	def self.displayAttribAndGetInput(questionStr)
		displayAttributeList

		print "\n" + questionStr + ": "
  		attrib = JayCRMUtils::getChoiceNum
		print attrib
  		
  		if (attrib > 4 || attrib == 0)
  			print "\nInvalid Input Entered..."
  			JayUtils::getChar
  			return 0
  		end
  		
  		return attrib
	end

	def self.displayAllContacts(contacts)				
		contactsArr = contacts
		contactCount = contactsArr.length 

		puts "#{contactCount} Contact(s) in the Rolodex\n\n"
		i = 1
		contactsArr.each do |a|
			puts "[#{i}]  |  #{a.id}  | #{a.lastName}, #{a.firstName}"
			a.displayId = i;
			i+=1
		end
	end

#
#
#
#
# This method validates input for modifying and deletion of contacts
	def self.displayInstructionGetInput(instructionStr, count, contacts)
		displayAllContacts(contacts)

		if count < 1
			print "No contacts. Press any key to return to main menu..."
			JayUtils::getChar
			return 0 
		end

		print "\n#{instructionStr}: "
		idx = gets.chomp.to_i

		if (idx > count || idx == 0)
			print "Entered Number is not in the Contacts List. Press any key to go back to main..."
			JayUtils::getChar
			return 0
		end
		return idx
	end

	def self.displayAttributeList
		puts "--- [1] First Name"
		puts "--- [2] Last Name"
		puts "--- [3] Email Address"
		puts "--- [4] Note"
	end
end