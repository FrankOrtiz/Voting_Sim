require "./voting_classes.rb"

def politician_test
	# Create politicians
	Politician.new("Frank Ortiz", "Democrat")
	puts Politician.all[0].name == "Frank Ortiz"
	puts Politician.all[0].party == "Democrat"

	Politician.new("Jay Jones", "Republican")
	puts Politician.all[1].name == "Jay Jones"
	puts Politician.all[1].party == "Republican"

	# List politicians
	Politician.list


	# Search politician
	puts Politician.find_by("Frank Ortiz") == Politician.all[0]
	puts Politician.find_by("Jay Jones") == Politician.all[1]

	# Update politicians
	Politician.find_by("Frank Ortiz").name = "New Name"
	puts Politician.all[0]

	puts Politician.find_by("Frank Ortiz") == nil
end

def person_test
	# Create persons
	Person.new("Frank Ortiz", "Green")
	puts Person.all[0].name == "Frank Ortiz"
	puts Person.all[0].politics == "Green"

	Person.new("Jay Jones", "Liberal")
	puts Person.all[1].name == "Jay Jones"
	puts Person.all[1].politics == "Liberal"

	# List persons
	Person.list

	# Update politicians

end

def test_sim
	politician_test
	# person_test
end

test_sim
