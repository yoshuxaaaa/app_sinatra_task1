# frozen_string_literal: true

require 'pg'
require 'dotenv'

class Post
  def self.all
    result = connection.exec('SELECT * FROM books')
    array = []
    result.each do |tuple|
      array << Hash[:id, tuple['id'], :title, tuple['title'], :content, tuple['content']]
    end
    array
  end

  def self.find(id)
    result = connection.exec("SELECT * FROM books WHERE id = '#{id}';")
    hash = {}
    result.each do |tuple|
      hash = { id: tuple['id'], title: tuple['title'], content: tuple['content'] }
    end
    hash
  end

  def self.create(title, content)
    connection.exec("INSERT INTO books (id, title, content) VALUES (nextval('id_seq'), '#{title}', '#{content}');")
  end

  def self.patch(id, title, content)
    connection.exec("UPDATE books SET id = '#{id}', title = '#{title}', content = '#{content}' WHERE id = '#{id}';")
  end

  def self.delete(id)
    connection.exec("DELETE FROM books WHERE id = '#{id}';")
  end

  def self.connection
    Dotenv.load
    connection ||= PG.connect(host: ENV['PG_HOST'], user: ENV['PG_USER'], password: ENV['PG_PASSWORD'], dbname: ENV['PG_DB'], port: ENV['PG_PORT'])
  end

  private_class_method :connection
end
