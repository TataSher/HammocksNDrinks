require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :email, :password, :name, :username

  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email, password, name, username)
    encrypt_pwd = BCrypt::Password.create(password)
    sql = "INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{encrypt_pwd}', '#{name}', '#{username}') RETURNING id, email, password, name, username;"
      begin
        result = DatabaseConnection.query(sql).first
        User.new(result["id"], result["email"], result["password"], result["name"], result["username"])
      rescue StandardError => e
        p e
        return
      end
    end

  def self.sign_in(email, password)
    sql = "SELECT * FROM users WHERE email='#{email}'"
    result = DatabaseConnection.query(sql)
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]["id"], result[0]["email"], result[0]["password"], result[0]["name"], result[0]["username"])
  end

end
