require_relative 'jayCrmUtils.rb'

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
		
		searchStrategy = SearchStrategy.new

		case attrib
		when 1 then searchStrategy = FirstNameSearch.new 
		when 2 then searchStrategy = LastNameSearch.new
		when 3 then searchStrategy = EmailSearch.new
		when 4 then searchStrategy = NotesSearch.new
		end

		results = searchStrategy.search(searchKey, contacts)

		return results
	end
end