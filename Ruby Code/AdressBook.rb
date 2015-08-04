class AdressBook
	def initialize
		@adresses = Array.new
	end

	def addContact(contact)
		@adresses.push(contact)
	end

	def showAdresses
		@adresses.each do |contato|
			contato.showContact
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
		puts "Adress: #{@street} #{@number} #{@postalCode}"
	end
end

class Contact
	def initialize(name,phone,adr)
		@name = name
		@phone = phone
		@adr = adr
	end

	def showContact
		puts "Contact: #{@name} #{@phone}"
		@adr.showAdress
	end
end

firstAdress = Adress.new("Av. Ayrton Senna",2023, 59151902)
secondAdress = Adress.new("Av. Salgado Filho",5050, 599000)

c1 = Contact.new("Mateus","9999-8888", firstAdress)

c2 = Contact.new("Julia","7777-6666", secondAdress)


adBook = AdressBook.new
adBook.addContact(c1)
adBook.addContact(c2)
adBook.showAdresses

