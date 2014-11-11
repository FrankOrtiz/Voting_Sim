class Voter
	attr_accessor :name
	@@ballots = {rep: 1, dem:1}
	def initialize(name)
		@name = name
	end
	def to_s
		"#{self.class}: #{name}"
	end
	def self.list
		self.all.each do |instance|
			puts instance
		end
	end
	def self.find_by(name)
		self.all.each do |instance|
			if instance.name == name
				return instance
			end
		end
		return nil
	end
	def self.vote
		Person.all.each do |person|
			person.consider(Politician.all.sample)
		end
		dark_hole
		puts "The ballots are in!"
		@@ballots.each do |k,v|
			puts "#{k}: #{v}"
		end
		@@ballots = {rep: 1, dem:1}
	end
	def tally(party)
		if party == :rep
			@@ballots[:rep] += 1
		else
			@@ballots[:dem] += 1
		end
	end
end

class Politician < Voter
	attr_accessor :party
	@@politicians = []
	def initialize(name, party)
		super(name)
		@party = party
		@@politicians << self
	end
	def self.all
		@@politicians
	end
	def to_s
		"#{party} " + super
	end
	def self.parties
		["Democrat", "Republican"]
	end
end

class Person < Voter
	attr_accessor :politics
	@@persons = []
	def initialize(name, politics)
		super(name)
		@politics = politics
		@@persons << self
	end
	def self.all
		@@persons
	end
	def to_s
		"#{politics} " + super
	end
	def self.political_views
		["Tea Party", "Conservative", "Neutral", "Liberal", "Socialist" ]
	end
	def consider(politician)
		case politics
		when "Tea Party"
			view_party(politician, 10)
		when "Conservative"
			view_party(politician, 25)
		when "Neutral"
			view_party(politician, 50)
		when "Liberal"
			view_party(politician, 75)
		when "Socialist"
			view_party(politician, 90)
		end
	end
	def vote(party)
		Voter.tally(party)
	end
	def view_party(politician, prob)
		chance = rand(100) + 1
		if (politician.party == "Republican") && (chance > prob)
			tally(:rep)
		elsif (politician.party == "Democrat") && (chance < prob)
			tally(:dem)
		else 
			view_party(politician, prob)
		end
	end
end


