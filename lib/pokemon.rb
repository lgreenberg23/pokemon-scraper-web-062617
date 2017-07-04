require 'pry'

class Pokemon

attr_accessor :name, :type, :db, :id

	# @@all_id = []

	def initialize (name)
		@name = name
		@type = ""
		@db = ''
		@id = 0
	end


	def self.save(name, type, db)
		ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
		ins.execute(name, type)

		# "INSERT INTO #{db} ((name, type) VALUES (#{@id}, #{name}, #{type})"

	end

	def self.find(id_num, db)
		type = db.execute("SELECT type FROM pokemon WHERE #{id_num} = id")
		name = db.execute("SELECT name FROM pokemon WHERE #{id_num} = id")
		#binding.pry
		type = type.flatten.join
		name = name.flatten.join

		new_pokemon = self.new(name)
		new_pokemon.type = type
		new_pokemon.id = id_num
		new_pokemon
	end

end
