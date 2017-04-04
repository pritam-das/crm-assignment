require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true                #repeat indefinitely
      print_main_menu
      user_selected = gets.chomp.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Delete all contacts'
    puts '[7] Exit'
    puts 'Enter a number'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then delete_all_contacts
    when 7 then abort("Goodbye!")
    end
  end

  def add_new_contact
    puts "Enter first name: "
    first_name = gets.chomp

    puts "Enter last name"
    last_name = gets.chomp

    puts "Enter the email address"
    email = gets.chomp

    puts "Enter the note that you want to add to the contact"
    note = gets.chomp
    Contact.create(first_name, last_name, email, note)
    puts "A contact for #{first_name} #{last_name} has been succesfully added to your directory"
  end

  def modify_existing_contact
    puts "Please enter the id of the contact you want to modify"
    id = gets.chomp.to_i
    contact_to_modify = Contact.find(id)
    puts "Which attribute of #{contact_to_modify.first_name} do you want to update?\n Press 1 for First Name\n Press 2 for Last Name\n Press 3 for Email\n Press 4 for Note"
    response = gets.chomp.to_i
    if response==1
      puts "Enter the new first name for this contact"
      response2 = gets.chomp.to_s
      contact_to_modify.first_name = response2
      puts "The first name of #{contact_to_modify.last_name}has been succesfully modified to #{contact_to_modify.first_name}!"
    elsif response==2
      puts "Enter the new last name for this contact"
      response2 = gets.chomp.to_s
      contact_to_modify.last_name = response2
      puts "The last name of #{contact_to_modify.first_name}has been succesfully modified to #{contact_to_modify.last_name}!"
    elsif response==3
      puts "Enter the new email for this contact"
      response2 = gets.chomp.to_s
      contact_to_modify.email = response2
      puts "The email of #{contact_to_modify.first_name} #{contact_to_modify.last_name} has been succesfully modified to #{contact_to_modify.email}!"
    elsif response==4
      puts "Enter the new note for this contact"
      response2 = gets.chomp.to_s
      contact_to_modify.note = response2
      puts "The note of #{contact_to_modify.first_name} #{contact_to_modify.last_name} has been succesfully modified to #{contact_to_modify.note}!"
    else
      puts "Wrong input, try again!"
    end

  end

  def delete_contact
    puts "Please enter the id of the contact you want to delete"
    id = gets.chomp.to_i
    contact_to_delete = Contact.find(id)
    puts "Are you sure you want to delete the contact for #{contact_to_delete.first_name} #{contact_to_delete.last_name}? Y / N"
    response = gets.chomp.downcase
          if response=='y'
            contact_to_delete.delete
            puts "The contact has been succesfully deleted"
          else
            puts "Loading main menu"
            self.main_menu
          end
  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
      Contact.find_by
  end

  def delete_all_contacts
    Contact.delete_all
  end

  a_crm_app = CRM.new
    a_crm_app.main_menu

end
