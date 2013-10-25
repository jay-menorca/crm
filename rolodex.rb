class Rolodex
	attr_accessor :contacts, :key

	def initialize()
		@contacts = Array.new
		@key = 1000
	end

	def addContact(contact)
		@contacts << contact
		@contacts.sort! 
		@key += 1
	end

	def deleteContact(x)
		idx = x - 1
		contacts.delete_at(idx)
	end

	def getContactDetails(x)
		idx = x - 1
		if contacts[idx]==nil
			return "none"
		else
			return contacts[idx]
		end
	end


end