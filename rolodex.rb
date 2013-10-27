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

	def getContactCount
		return contacts.length;
	end

	def getContactDetails(x)
		idx = x - 1
		if contacts[idx]==nil
			return "none"
		else
			return contacts[idx]
		end
	end

	def getContactDetailsByAttribute(searchKey, attrib)
		case attrib
		when 1 then results = searchContactsByFirstName(searchKey)
		when 2 then results = searchContactsByLastName(searchKey)
		when 3 then results = searchContactsByEmail(searchKey)
		when 4 then results = searchContactsByNote(searchKey)
		end

		return results
	end

	def searchContactsByFirstName(key)
		key = key.capitalize
		results = Array.new
		contacts.each do |a|
			if a.firstName.include? key
				results << a
			end
		end
		return results
	end

	def searchContactsByLastName(key)
		key = key.upcase
		results = Array.new
		contacts.each do |a|
			if a.lastName.include? key
				results << a
			end
		end
		return results
	end

	def searchContactsByEmail(key)
		results = Array.new
		contacts.each do |a|
			if a.email.include? key
				results << a
			end
		end
		return results
	end

	def searchContactsByNote(key)
		results = Array.new
		contacts.each do |a|
			if a.note.include? key
				results << a
			end
		end
		return results
	end
end