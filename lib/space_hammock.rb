class SpaceHammock
  def self.create(name, description, price_per_night, user_id)
    sql = "INSERT INTO hammocks (name, description, price_per_night, user_id) VALUES ('#{name}', '#{description}', #{price_per_night}, #{user_id})"
    PG.exec(sql)
  end
end
