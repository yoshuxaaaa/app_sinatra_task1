namespace :initializaion_db do
  desc "create db"
  task :create_db do
    @connection = PG::connect(:host => ENV["PG_HOST"], :user => ENV["PG_USER"], :password =>ENV["PG_PASSWORD"], :port => ENV["PG_PORT"])
    @connection.exec("CREATE DATABASE dictionary;")
  end

  desc "create table"
  task :create_table do
    @connection = PG::connect(:host => ENV["PG_HOST"], :user => ENV["PG_USER"], :password =>ENV["PG_PASSWORD"], :dbname => ENV["PG_DB"], :port => ENV["PG_PORT"])
    @connection.exec("CREATE TABLE books (id CHAR(4) NOT NULL, title TEXT NOT NULL, content TEXT NOT NULL, PRIMARY KEY (id));")
    @connection.exec("CREATE sequence id_seq;")
  end
end
