require "./voting_classes.rb"
require "./voting_methods"

def politician_test
	# Create politicians
	Politician.new("Charlie Chaplin", "Democrat")
	puts Politician.all[0].name == "Charlie Chaplin"
	puts Politician.all[0].party == "Democrat"

	Politician.new("Jay Jones", "Republican")
	puts Politician.all[1].name == "Jay Jones"
	puts Politician.all[1].party == "Republican"

	# List politicians
	Politician.list

	# Search politician
	puts Politician.find_by("Charlie Chaplin") == Politician.all[0]
	puts Politician.find_by("Jay Jones") == Politician.all[1]

	# Update politicians
	Politician.find_by("Charlie Chaplin").name = "New Name"
	Politician.find_by("New Name").party = "New Party"
	puts Politician.all[0].to_s == "New Party Politician: New Name"

	# List updated politicians
	Politician.list
end

def person_test
	# Create persons
	Person.new("Charlie Chaplin", "Green")
	puts Person.all[0].name == "Charlie Chaplin"
	puts Person.all[0].politics == "Green"

	Person.new("Jay Jones", "Liberal")
	puts Person.all[1].name == "Jay Jones"
	puts Person.all[1].politics == "Liberal"

	# List persons
	Person.list

	# Update persons
	Person.find_by("Charlie Chaplin").name = "New Name"
	Person.find_by("New Name").politics = "New Politics"
	puts Person.all[0].to_s == "New Politics Person: New Name"

	# List update persons
	Person.list
end

def test_sim
	politician_test
	person_test
end
