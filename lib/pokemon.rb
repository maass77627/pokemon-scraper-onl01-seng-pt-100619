class Pokemon

attr_accessor :name, :type, :db

attr_reader :id

def initialize(id:, name:, type:, db:)
  @id = id 
  @name = name 
  @type = type 
  @db = db 
end 

def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
end 


def self.find(id, db) 
found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten 
end 

end 
