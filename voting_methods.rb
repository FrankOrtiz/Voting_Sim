require './voting_update.rb'
require './voting_create.rb'
require './voting_election.rb'

def dark_hole(item=nil)
	40.times do 
		puts ""
	end
	item
end

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

def ask_politics(question)
	politics = ask_formal(question)
	if Person.political_views.include? politics
		return politics
	else 
		ask_politics("	  Please choose a valid political view.\n#{Person.political_views[0]}, #{Person.political_views[1]}, #{Person.political_views[2]}, #{Person.political_views[3]} or #{Person.political_views[4]} ")
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


def sample
	Politician.new("Jimmy John", "Democrat")
	Politician.new("Timmy Ton", "Republican")
	Person.new("Kira Kingly", "Tea Party")
	Person.new("Robert Ron", "Conservative")
	Person.new("Alice Arnold", "Neutral")
	Person.new("Mike Mikerson", "Liberal")
	Person.new("Luis Lenard", "Socialist")
	dark_hole
end