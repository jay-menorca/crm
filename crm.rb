require_relative 'contact.rb'
require_relative 'rolodex.rb'
require_relative 'jayCrmUtils.rb'


class CRM
	@rolodex = Rolodex.new

	attr_accessor :rolodex

	def initialize(rolodex)
		@rolodex = rolodex
	end


	def print_main_menu
		JayCRMUtils::createHeader("Jay's CRM")
		puts "[1] Add a new contact"
  		puts "[2] Modify an existing contact"
  		puts "[3] Delete a contact"
  		puts "[4] Display all the contacts"
  		puts "[5] Display Contact Details" 
 		puts "[6] Exit"
  		puts "\nEnter a number: "
	end

	def main_menu
		print_main_menu
		user_selected = gets.to_i
		call_option(user_selected)
	end

	

	def call_option(selectedVal)
		case selectedVal
			when 1 then showAddContactsPage
			when 2 then showEditContactPage
			when 3 then showDeleteContactsPage
			when 4 then displayAllContacts
			when 5 then displayContactDetailsPage
			else 
		end
	end


	#TODO: add validation		
	def showAddContactsPage
		JayCRMUtils::createHeader("Add A Contact")
		print "Enter First Name\t: "
  		fName = gets.chomp
  		print "Enter Last Name\t\t: "
  		lName = gets.chomp
  		print "Enter Email Address\t: "
  		email = gets.chomp
  		print "Enter a Note\t\t: "
  		note = gets.chomp

  		print "\nCreate? (Y/N)\t\t: "
  		goCreate = gets.chomp.upcase

  		if goCreate=="Y"
  			aContact = Contact.new(rolodex.key, fName.capitalize, lName.upcase, email, note)
  			rolodex.addContact(aContact)
  			puts "Contact Added.\n\n-------------------------------------------\n"
  			puts "Add Another? (Y/N) :"
  			addAnother = gets.chomp.upcase

  			if addAnother=="Y"
  				showAddContactsPage
  			else
  				main_menu
  			end
  		else
  			main_menu
  		end
	end

	def showEditContactsPage
	end

	def showDeleteContactsPage
	end

	def displayAllContacts		
		JayCRMUtils::createHeader("Displaying All Contacts")
		rolodex.displayAllContacts
		print "\nPress any key to go back to main menu..."
		gets.chomp
		main_menu
	end

	def displayContactDetailsPage
		JayCRMUtils::createHeader("Displaying Contact Details")
		rolodex.displayAllContacts
		print "\nPress the number in [X] of the contact you which their details displayed:"
		idx = gets.chomp
	end
end

rolodex = Rolodex.new()
crmApp = CRM.new(rolodex)
crmApp.main_menu
