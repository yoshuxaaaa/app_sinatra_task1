# frozen_string_literal: true

require 'csv'

class Post
  def initialize
    @table = CSV.table('foo.csv')
  end

  def self.all
    Post.new
    @table
  end

  def self.find(id)
    Post.new
    @table.select{|row| row if row.field?(id.to_i) }.at(0).to_h
  end

  def self.create(title, content)
    Post.new
    check_id
    @table[@next_id] = [@next_id, title, content]
    save_table
  end

  def self.patch(id, title, content)
    Post.new
    @table[id.to_i] = [id, title, content]
    save_table
  end

  def self.delete(id)
    Post.new
    @table.delete(id.to_i)
    save_table
  end

  def self.check_id
    if @table[:id].last.nil?
      @next_id = 0
    else
      @next_id = @table[:id].last + 1
    end
  end

  def self.save_table
    header = ['id', 'title', 'content']
    CSV.open('foo.csv', 'w', headers: true) do |csv|
      csv << header if @table.headers.compact.empty?
      @table.to_a.each do |record|
        if !record.compact.empty?
          csv << record
        end
      end
    end
  end

  private_class_method :check_id
  private_class_method :save_table
end
