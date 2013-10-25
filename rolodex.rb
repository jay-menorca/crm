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
		results = Array.new
		contacts.each do |a|
			if a.firstName.include? mKey
				results << a
			end
		end
	end

	def searchContactsByLastName(key)
		mKey = key.to_s.upcase
		results = Array.new
		contacts.each do |a|
			if a.lastName.include? mKey
				results << a
			end
		end
	end

	def searchContactsByEmail(key)
		results = Array.new
		contacts.each do |a|
			if a.email.include? mKey
				results << a
			end
		end
	end

	def searchContactsByNote(key)
		results = Array.new
		contacts.each do |a|
			if a.note.include? mKey
				results << a
			end
		end
	end
end