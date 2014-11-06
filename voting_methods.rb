require './voting_update.rb'
require './voting_create.rb'

def break_line(br=nil)
	puts "------------------------------------------------------"
	if br
		puts ""
	end
end

def ask(question)
	break_line
	puts question
	break_line
	break_line(true)
	gets.chomp.downcase
end

def ask_formal(question)
	break_line
	puts question
	break_line(true)
	gets.chomp.split.map(&:capitalize).join(' ')
end

def ask_party(question)
	party = ask_formal(question)
	if Politician.parties.include? party
		return party
	else 
		ask_party("	  Please choose a valid party.\n \t    #{Politician.parties[0]} or #{Politician.parties[1]} ")
	end
end

def list
	puts "----------------------Politicians---------------------"
	puts ""
	if Politician.all.empty?
		puts "*There are no politicians currently running"
	else
		Politician.list
	end
	puts ""
	break_line
	puts "------------------------Person------------------------"
		puts ""
	if Person.all.empty?
		puts "*There are no people currently voting"
	else
		Person.list
	end
	puts ""
	break_line
end