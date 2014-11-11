
def update(object)
	case object
	when "politician"
		update_politician
		@updated = true
	when "person"
		update_person
		@updated = true
	else
		puts "Not a valid option."
	end
end

def update_politician
	updated_politician = Politician.find_by(ask_formal("What is the name of the politician you would like to edit?"))
	if updated_politician
		update_by_option(updated_politician)
	else
		return puts "A politician by that name could not be found in the system."
	end
	puts "You have updated a politician."
	puts "#{updated_politician.party} Politician: #{updated_politician.name}."
end

def update_person
	updated_person = Person.find_by(ask_formal("What is the name of the person you would like to edit?"))
	if updated_person
		update_by_option(updated_person)
	else
		return puts "A person by that name could not be found in the system."
	end
	puts "You have updated a person."
	puts "#{updated_person.politics} Person: #{updated_person.name}."
end

def update_by_option(object)
	if object.class == Politician
		case ask("Would you like to update the name or the party of Politician #{object.name}?")
		when "name"
			object.name = ask_formal("What would you like to rename #{object.name}?")
		when "party"
			object.party = ask_party("What party would you like to have #{object.name} join?")
		end
	else
		case ask("Would you like to update the name or the politics of #{object.name}?")
		when "name"
			object.name = ask_formal("What would you like to rename #{object.name}?")
		when "politics"
			object.politics = ask_politics("What political view would you like to have #{object.name} join?")
		end
	end
end
