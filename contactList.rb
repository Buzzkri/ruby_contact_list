@contacts = [
  {first_name: "Saac", last_name: "Stewart", phone: "(555)263-7572" },
  {first_name: "Coleen", last_name: "Wagdangle", phone: "(555)701-0142" },
  {first_name: "Been", last_name: "Start", phone: "" },
  {first_name: "Weed", last_name: "PeePeeSon", phone: "" },
  {first_name: "Bard", last_name: "ButtHead", phone: "1234567890" },
]
@menuOptions = ["***Ruby Contact List***", "What would you like to do?", "1) Create Contact", "2) View Contacts", "3) Edit Contact", "4) Delete Contact", "5) exit"] 

def main_menu
  puts @menuOptions
    input = gets.strip
      case input
        when "1"
          create_contact
        when "2"
          view_contacts
        when "3"
          edit_contact
        when "4"
          delete_contact
        when "5"
          puts "bye"
          exit
        else
          puts "No way, Jose!"
          main_menu
      end

end


def create_contact
  puts "What is the first name?"
    first_name = gets.strip
  puts "What is the last name?"
    last_name = gets.strip
  puts "What is the first name?"
    phone = gets.strip.to_i

    # puts "Please enter a phone number"
    # phone_number = gets.chomp.to.i
    @contacts << { first_name: first_name, last_name: last_name, phone: phone }
    main_menu
end

def view_contacts
  @contacts.each_with_index do |c, i|
    puts "#{i+1}) #{c[:first_name]}"
  end
  puts "Which would you like to view?"
  input = gets.strip.to_i
  puts "You have selected #{@contacts[input - 1][:first_name]} #{@contacts[input - 1][:last_name]} #{@contacts[input - 1][:phone]}" 
  sleep(1)
  puts "Would you like to view another contact? (y/n)"
  flow_options = gets.strip
  if flow_options == "y" ? view_contacts : main_menu
  end
end

def edit_contact
  # puts "which contact would you like to edit?"
  # @contacts.each_with_index do |c, i|
  #   puts "#{i+1}) #{c[:first_name]}"
  # end
  #   input = gets.strip.to_i
  #   puts "what would you like the updated name to be?"
  #   update_contact = gets.chomp
  #     # @contacts.push(update_contact)
  #     @contacts.update_at(input - 1)
  #     @contacts.push(update_contact)
  #   # find contact. get input from user. replace the content in that array ID with new input. spit out new 
  #   main_menu
  @contacts.each_with_index do |c, i|
      puts "#{i+1}) #{c[:first_name]}"
    end
  puts "Which contact would you like to edit?"
  @contact_to_edit = gets.strip.to_i - 1
  puts "What would you like to change?"
  puts "1) First name"
  puts "2) Last name"
  puts "3) Phone number"
  change_requested = gets.strip.to_i
  case change_requested
  when 1
    puts "Please enter the new first name"
    new_first_name = gets.strip.to_s
    @contacts[@contact_to_edit][:first_name] = new_first_name
  when 2
    puts "Please enter the new last name"
    new_last_name = gets.strip.to_s
    @contacts[@contact_to_edit][:last_name] = new_last_name
  when 3
    puts "Please enter the new phone number"
    new_phone = gets.strip
    @contacts[@contact_to_edit][:phone] = new_phone
  else
    puts "This is not a valid selection"
    edit_contact
  end
  puts "Do you need to edit anything else?"
  print "Y/N? >"
  y_n = gets.strip
  if y_n == "Y" ? edit_contact : main_menu
  end
end

def delete_contact
  puts "Which contact would you like to delete?"
  @contacts.each_with_index do |c, i|
    puts "#{i+1}) #{c}"
  end
  selection = gets.strip.to_i - 1
  puts "#{@contacts[selection]} has been deleted"
  @contacts.delete_at(selection)

  main_menu
end

main_menu