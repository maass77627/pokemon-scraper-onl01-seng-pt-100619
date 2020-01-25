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
  sql = <<-SQL 
  INSERT INTO pokemons (name, type)
  VALUES (?,?)
  SQL
  
  db.execute(sql, self.name, self.type)
  @id = db.execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
end 


def self.find(id) 
  sql = "SELECT * FROM pokemons WHERE id = ?"
  result = db.execute(sql,id)[0]
  Pokemon.new(result[0], result[1], result[2])
end 

end 
