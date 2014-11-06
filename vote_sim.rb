require "./voting_classes.rb"
require "./voting_methods"

loop do
	case ask("Create, List, Update, Vote, or Exit")
	when "create"
		until @created
			create(ask("Create Politician or Person?"))
		end
		@created = false
	when "list"
		list
	when "update"
		until @updated
			update(ask("Update Politician or Person?"))
		end
		@updated = false
	when "vote"
	when "exit"
		break
	end
end