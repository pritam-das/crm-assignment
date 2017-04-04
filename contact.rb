class Contact

@@contacts = []
@@id = 1
attr_reader :id
attr_accessor :first_name, :last_name, :email, :note
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id=@@id
    @@id+=1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
      @new_contact = Contact.new(first_name, last_name, email, note)
      @@contacts << @new_contact
      @new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    puts "You have the following contacts in your directory:\n"
    @@contacts.each do |each_contact|
      puts "#{each_contact.first_name} #{each_contact.last_name}"
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |each_contact|
      if (each_contact.id == id)
        return each_contact
      end
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    puts "Which attribute of #{self.first_name} do you want to update?\n Press 1 for First Name\n Press 2 for Last Name\n Press 3 for Email\n Press 4 for Note"
    response = gets.chomp.to_i
    if response==1
      puts "Enter the new first name for this contact"
      response2 = gets.chomp.to_s
      self.first_name = response2
    elsif response==2
      puts "Enter the new last name for this contact"
      response2 = gets.chomp.to_s
      self.last_name = response2
    elsif response==3
      puts "Enter the new emai for this contact"
      response2 = gets.chomp.to_s
      self.email = response2
    elsif response==4
      puts "Enter the new note for this contact"
      response2 = gets.chomp.to_s
      self.note = response2
    else
      puts "Wrong input, try again!"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
      puts "Which attribute do you want to search your contact directory by?\n Press 1 for First Name\n Press 2 for Last Name\n Press 3 for Email\n Press 4 for Note"
      response = gets.chomp.to_i
      if response==1
        puts "Enter the first name you're looking for\n"
        response2 = gets.chomp.to_s
        @@contacts.each do |each_contact|
          if(each_contact.first_name == response2)
            puts "#{each_contact.first_name} #{each_contact.last_name} Email: #{each_contact.email} Note: #{each_contact.note}"
          end
        end
      elsif response==2
          puts "Enter the last name you're looking for\n"
          response2 = gets.chomp.to_s
          @@contacts.each do |each_contact|
            if(each_contact.last_name == response2)
              puts "#{each_contact.first_name} #{each_contact.last_name} Email: #{each_contact.email} Note: #{each_contact.note}"
            end
          end
        elsif response==3
            puts "Enter the email you're looking for\n"
            response2 = gets.chomp.to_s
            @@contacts.each do |each_contact|
              if(each_contact.email == response2)
                puts "#{each_contact.first_name} #{each_contact.last_name} Email: #{each_contact.email} Note: #{each_contact.note}"
              end
            end
          elsif response==4
              puts "Enter the note you're looking for\n"
              response2 = gets.chomp.to_s
              @@contacts.each do |each_contact|
                if(each_contact.note == response2)
                  puts "#{each_contact.first_name} #{each_contact.last_name} Email: #{each_contact.email} Note: #{each_contact.note}"
                end
              end
          else
            puts "Wrong input, try again!"
          end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
    puts "All your contacts have been succesfully deleted!"
    @@contacts
  end

  def full_name
    puts "#{self.first_name} #{self.last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
    puts "The contact has been succesfully deleted!"
  end

  # Feel free to add other methods here, if you need them.

end
