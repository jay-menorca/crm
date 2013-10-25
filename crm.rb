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
 		puts "[6] Display Contact(s) by Attribute"
 		puts "[7] Exit"
  		puts "\nEnter a number: "
	end

	def main_menu
		print_main_menu
		user_selected = gets.to_i
		call_option(user_selected)
	end

	

	def call_option(selectedVal)
		case selectedVal
			when 1 then displayAddContactsPage
			when 2 then displayEditContactPage
			when 3 then displayDeleteContactsPage
			when 4 then displayAllContactsPage
			when 5 then displayContactDetailsPage
			when 6 then displayContactsByAttribute
			else 
		end
	end


	#TODO: add validation		
	def displayAddContactsPage
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
  			
  			addAnother = JayCRMUtils::createChoiceFooter("Contact Added.", "Add Another?")
  			if addAnother=="Y"
  				displayAddContactsPage
  			else
  				main_menu
  			end
  		else
  			main_menu
  		end
	end

	def doModify(contact, attrib)
	  	strValue = "Current "
	  	case attrib
	  	when 1 then value = "first name is : " + contact.firstName 	
		when 2 then value = "last name is : " + contact.lastName
		when 3 then value = "email name is : " + contact.email
		when 4 then value = "note is : " + contact.note
		else
			displayEditContactPage
		end		

		print value + ". Please enter the modified value: "
		newVal = gets.chomp

		print "\nDo you really wish to modify? (Y/N)\t\t: "
  		goModify = gets.chomp.upcase

  		if goModify!="Y"
  			displayEditContactPage
  		end

		case attrib
	  	when 1 then contact.firstName = newVal 	
		when 2 then contact.lastName = newVal
		when 3 then contact.email = newVal
		when 4 then contact.note = newVal
		end		
	end

	def displayEditContactPage
		JayCRMUtils::createHeader("Edit Contact Details")
		displayAllContacts
		print "\nPress the number [X] of the contact you want to modify: "
		idx = gets.chomp.to_i
		contact = rolodex.getContactDetails(idx)

		if (contact!="none")
			displayContactDetail(contact)
			displayAttributeList

			print "\nPlease enter the no. attribute [X] you wish to Modify: "
	  		attrib = gets.chomp.to_i

	  		doModify(contact, attrib)

  			modifyAgain = JayCRMUtils::createChoiceFooter("Contact Modified.", "Modify Another?")
	  		if modifyAgain=="Y"
	  			displayEditContactPage
	 		else
	  			main_menu
	  		end
	  	else
  			puts "No contact details found for entered value."
  			gets
  			displayEditContactPage
  		end
	end

	def displayDeleteContactsPage
		JayCRMUtils::createHeader("Delete Contact Details")
		displayAllContacts 
		print "\nPress the number [X] of the contact you want to delete: "
		idx = gets.chomp.to_i
		contact = rolodex.getContactDetails(idx)

		if (contact!="none")
			print "\nDo you really wish to delete? (Y/N)\t\t: "
	  		goDelete = gets.chomp.upcase

	  		if goDelete=="Y"
	  			rolodex.deleteContact(idx)

	  			deleteAnother = JayCRMUtils::createChoiceFooter("Contact Deleted.", "Delete Another?")
		  		if deleteAnother=="Y"
		  			displayDeleteContactsPage
		 		else
		  			main_menu
		  		end
	  		else
	  			main_menu
	  		end
	  	else
  			puts "No contact details found for entered value."
  			gets
  			displayDeleteContactsPage
  		end
	end

	def displayAllContactsPage
		JayCRMUtils::createHeader("Displaying All Contacts")
		displayAllContacts
		JayCRMUtils::createBackToMain
		main_menu
	end

	def displayAllContacts				
		contactsArr = rolodex.contacts
		contactCount = contactsArr.length 

		puts "#{contactCount} Contact(s) in the Rolodex\n\n"
		i = 1
		contactsArr.each do |a|
			puts "[#{i}]  |  #{a.id}  | #{a.lastName}, #{a.firstName}"
			a.displayId = i;
			i+=1
		end
	end

	def displayAttributeList
			puts "\n--- [1] First Name"
			puts "--- [2] Last Name"
			puts "--- [3] Email Address"
			puts "--- [4] Note"
	end

	def displayContactDetail(contact)
			puts "\nLast Name\t: #{contact.lastName}"
  			puts "First Name\t: #{contact.firstName}"
  			puts "Email Address\t: #{contact.email}"
  			puts "Note\t\t: #{contact.note}"
	end

	def displayContactDetailsPage
		JayCRMUtils::createHeader("Displaying Contact Details")
		displayAllContacts
		print "\nPress the number [X] of the contact you wish the details displayed: "
		idx = gets.chomp.to_i
		contact = rolodex.getContactDetails(idx)

		if (contact!="none")
			displayContactDetail(contact)
  			displayAnother = JayCRMUtils::createChoiceFooter("Contact Displayed.", "Display Another?")
	  		if displayAnother=="Y"
	  			displayContactDetailsPage
	 		else
	  			main_menu
	  		end
  		else
  			puts "No contact details found for entered value."
  			gets
  			displayContactDetailsPage
  		end
	end

	def displayContacts(results)
	 	i=1;
		results.each do |a|
			puts "[#{i}]  |  #{a.id}  | #{a.lastName}, #{a.firstName}"
			i = i + 1;
		end
	end

	def displayContactsByAttribute
		JayCRMUtils::createHeader("Displaying contacts according to attribute")

		displayAttributeList

		print "\nPlease enter the no. attribute [X] you wish to use to retrieve contacts: "
	  	attrib = gets.chomp.to_i
	  	print "\nPlease enter the search value you wish to use to retrieve contacts: "
	  	searchKey = gets.chomp.to_s

	  	results = rolodex.getContactDetailsByAttribute(searchKey, attrib)

	  	displayContacts(results)

  		searchAgain = JayCRMUtils::createChoiceFooter("Contact(s) Returned.", "Search some more?")
	  	if searchAgain=="Y"
	  		displayContactsByAttribute
	 	else
	  		main_menu
	  	end
	end
end

rolodex = Rolodex.new()
crmApp = CRM.new(rolodex)
crmApp.main_menu
