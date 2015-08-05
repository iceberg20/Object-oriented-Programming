class AdressBook
	def initialize
		@adresses = Array.new
	end

	def addContact(contact)
		@adresses.push(contact)
		puts "Contact Added successfully!"
		puts "> > Updated Contacts List < < "
		self.showAdresses
	end

	def removeContact(name)
		name = name.chomp
		index = 0
		@adresses.each do |contact|
			index = index+1
			if contact.name == name
				@adresses.delete(contact)
				puts "Contact Removed successfully!"
				puts "> > Updated Contacts List < < "
				self.showAdresses
			end
		end
	end

	def showAdresses
		elements =0
		@adresses.each do |contato|
			contato.showContact
			elements =+1
		end
		if elements == 0
			puts "Your list is empty! Please add some contats!"
			puts
		end
	end
end

class Adress
	def initialize(street, number, postalCode)
		@street = street
		@number = number
		@postalCode = postalCode
	end

	def showAdress
		puts "Adress: #{@street}"
		puts "Adress Number: #{@number}"
		puts "Postal Code: #{@postalCode}"
	end
end

class Contact
	
	def initialize(name,phone,adr)
		@name = name
		@phone = phone
		@adr = adr
	end

	def name
		@name
	end

	def showContact
		puts "Name: #{@name}"
		puts "Phone: #{@phone}"
		@adr.showAdress
	end
end
=begin
firstAdress = Adress.new("Av. Ayrton Senna",2023, 59151902)
secondAdress = Adress.new("Av. Salgado Filho",5050, 599000)

c1 = Contact.new("Mateus","9999-8888", firstAdress)

c2 = Contact.new("Julia","7777-6666", secondAdress)


adBook = AdressBook.new
adBook.addContact(c1)
adBook.addContact(c2)
adBook.showAdresses
=end
puts "###################################"
puts "### Welcome to the AdressBook! ####"
puts "### Developed by Ítalo Berg #######"
puts "###################################"
puts
puts

adBook = AdressBook.new 


firstAdress = Adress.new("Av. Ayrton Senna",2023, 59151902)
secondAdress = Adress.new("Av. Salgado Filho",5050, 599000)
c1 = Contact.new("Mateus","9999-8888", firstAdress)
c2 = Contact.new("Renato","7777-6666", secondAdress)

adBook.addContact(c1)
adBook.addContact(c2)
adBook.showAdresses
#s = gets.chomp
#adBook.removeContact(s)



op = 10
while op!=0 do
	puts "Menu 1- Add Contact 2- Remove Contact  3-Show Contacts"
	op = gets.to_i	
	if op == 1 then
		puts "Type the name:"
		name = gets
		puts "Type the phone number"
		phone = gets
		puts "Type the street"
		street = gets
		puts "Type the adress number"
		adrNumber = gets
		puts "Type the postal code"
		postal = gets

		adr = Adress.new(street,adrNumber, postal)

		c1 = Contact.new(name,phone, adr)

		adBook.addContact(c1)
	elsif op == 2
		puts "Tye the name of the contact"
		name = gets.chomp
		adBook.removeContact(name)
	elsif op==3
		adBook.showAdresses
	else
		puts "Thanks for using the E-Adressbook!"
	end
end
