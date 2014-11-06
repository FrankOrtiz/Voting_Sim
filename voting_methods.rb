require './voting_update.rb'
require './voting_create.rb'

def ask(question)
	puts question
	gets.chomp.downcase
end

def ask_formal(question)
	puts question
	gets.chomp.split.map(&:capitalize).join(' ')
end

def list
	puts "---------Politicians---------"
	puts ""
	if Politician.all.empty?
		puts "*There are no politicians currently running"
	else
		Politician.list
	end
	puts ""
	puts "-----------------------------"
	puts "-----------Person------------"
		puts ""
	if Person.all.empty?
		puts "*There are no people currently voting"
	else
		Person.list
	end
	puts ""
	puts "-----------------------------"
end