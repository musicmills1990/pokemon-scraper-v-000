class Pokemon
attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, :hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

def self.find(id_num, db)
  info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
  Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
end

end
