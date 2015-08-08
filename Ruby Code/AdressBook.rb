class Controller
	def permitAdd(adBookRef, street, adrNumber, postal, name, phone)
		adr = Adress.new(street,adrNumber, postal)
		contactRef = Contact.new(name,phone, adr)
		adRef = adBookRef.adresses
		permit = true
		adRef.each do |contact|
			if contact.phone == phone
				permit = false
			end
		end
		if permit 
			adBookRef.addContact(contactRef)
			return true
		else
			return false
		end
	end

	def permitSearch(adBookRef, name)
		if name.class == "String"
			adBookRef.search(name)
			return true
		else
			return false
		end
	end
end

class AdressBook
	def initialize
		@adresses = Array.new
	end

	def adresses
		@adresses
	end

	def addContact(contact)
		@adresses.push(contact)
		puts "> > Updated Contacts List < < "
		self.showAdresses
	end

	def removeContact(name)
		removed = false
		name = name.chomp
		index = 0
		@adresses.each do |contact|
			index = index+1
			if contact.name == name
				@adresses.delete(contact)
				puts "> > Updated Contacts List < < "
				self.showAdresses
				removed = true
			end
		end
		return removed
	end	

	def find(name)
		out = false
		@adresses.each do |contact|
			if contact.name == name
				out = true
				self.removeContact(name)
			end
		end
		return out
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

	def search(name)
		out = nil
		@adresses.each do |contact|
			if contact.name == name
				out = contact
			end
		end
		return out
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

	def phone
		@phone
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
puts "### Welcome to the E-AdressBook! ####"
puts "### Developed by Ítalo Berg #######"
puts "####################################"
puts
puts

adBook = AdressBook.new 
appController = Controller.new

=begin
firstAdress = Adress.new("Av. Ayrton Senna",2023, 59151902)
secondAdress = Adress.new("Av. Salgado Filho",5050, 599000)
c1 = Contact.new("Mateus","9999-8888", firstAdress)
c2 = Contact.new("Renato","7777-6666", secondAdress)

adBook.addContact(c1)
adBook.addContact(c2)
adBook.showAdresses
#s = gets.chomp
#adBook.removeContact(s)


=end
op = 10
while op!=0 do
	puts "Menu 1- Add Contact 2- Remove Contact  3-Show Contacts 4-Update 5-Search 0-Exit"
	op = gets.to_i	
	if op == 1 then
		puts "Type the name:"
		name = gets.chomp
		puts "Type the phone number"
		phone = gets
		puts "Type the street"
		street = gets
		puts "Type the adress number"
		adrNumber = gets
		puts "Type the postal code"
		postal = gets

		if appController.permitAdd(adBook, street, adrNumber, postal, name, phone)
			puts "Contact Added successfully!"
		else
			puts "Sorry but this name of contact already was used"
		end

	elsif op == 2
		puts "Tye the name of the contact"
		name = gets.chomp
		if adBook.removeContact(name)
			puts "Contact Removed successfully!"
		else
			puts "Contact not found"
		end
	elsif op==3
		adBook.showAdresses
	elsif op==4
		puts "> > Update < <"
		puts "What contatc do you would like to update?"
		name  = gets.chomp
		if adBook.find(name)
			puts "> > Let's update! < <"
			puts "Type the name:"
			name = gets.chomp
			puts "Type the phone number"
			phone = gets.chomp
			puts "Type the street"
			street = gets.chomp
			puts "Type the adress number"
			adrNumber = gets
			puts "Type the postal code"
			postal = gets

			adr = Adress.new(street,adrNumber, postal)

			c1 = Contact.new(name,phone, adr)

			appController.permitAdd(adBook,c1)
		else
			puts "Contact not found"
		end
	elsif op==5
		puts "> > Search < <"
		puts "Type the name:"
		name = gets.chomp
		puts appController.permitSearch(adBook, name)
		if appController.permitSearch(adBook, name)

			appController.permitSearch(adBook, name).showContact
		else
			"Contact not found"
		end
	else
		puts "Thanks for using the E-Adressbook!"
		op = 0
	end
end
