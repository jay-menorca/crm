class Rolodex
	attr_accessor :contacts, :key

	def initialize()
		@contacts = Array.new
		@key = 1000
	end

	def addContact(contact)
		#contacts.push(contact)
		@contacts << contact
		@key += 1
	end

	def deleteContact(contact)
	end

	def displayContactDetails(x)
	end

	def displayAllContacts
		contactCount = contacts.length 

		puts "\n#{contactCount} Contact(s) in the Rolodex\n\n"
		i = 0
		contacts.each do |a|
			puts "[#{i}]  |  #{a.id}  | #{a.lastName}, #{a.givenName}"
			i+=1
		end
	end
end