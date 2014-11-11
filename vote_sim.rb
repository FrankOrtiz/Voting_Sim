require "./voting_classes.rb"
require "./voting_methods"

dark_hole
loop do
	case ask("Create, List, Update, Vote, or Exit")
	when "create"
		until @created
			dark_hole
			create(ask("Create Politician or Person?"))
		end
		@created = false
	when "list"
		dark_hole
		list
	when "update"
		until @updated
			dark_hole
			update(ask("Update Politician or Person?"))
		end
		@updated = false
	when "vote"
		Voter.vote
	when "exit"
		break
	when "sample"
		sample
	end
end