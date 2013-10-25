class Contact
	attr_accessor :id, :givenName, :lastName, :email, :note

	def initialize(id, givenName, lastName, email, note)
		@id = id
		@givenName = givenName
		@lastName = lastName
		@email = email
		@note = note
	end
end