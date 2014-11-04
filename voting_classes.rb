class Voter
	attr_accessor :name
	def initialize(name)
		@name = name
	end
	def to_s
		"#{name}"
	end
	def self.list
		self.all.each do |instance|
			puts instance
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
		"#{party} Politician: " + super
	end
	def self.find_by(name)
		self.all.each do |politician|
			if politician.name == name
				return politician
			end
		end
		return nil
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
		"#{politics} Politician: " + super
	end
end