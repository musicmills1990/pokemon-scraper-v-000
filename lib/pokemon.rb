class Pokemon
attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end


  def self.save(name, type, db, hp)
    db.execute("INSERT INTO pokemon(name, type, hp) VALUES (?, ?, ?)", name, type, hp)
  end

def self.find(id_num, db)
  info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
  Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
end

end
