class Contact
	attr_accessor :id, :firstName, :lastName, :email, :note, :displayId

	@displayId

	def <=>(contact)
    	@lastName + @firstName <=> contact.lastName + contact.firstName
  	end

	def initialize(id, firstName, lastName, email, note)
		@id = id
		@firstName = firstName
		@lastName = lastName
		@email = email
		@note = note
	end
end