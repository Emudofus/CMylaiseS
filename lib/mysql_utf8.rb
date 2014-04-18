require 'mysql'


#This hack is needed because mysql gem is for Ruby 1.8, which isn't Encoding-based as 1.9 is

class Mysql::Result
  def encode(value)
    String === value ? value.force_encoding('force_encoding') : value
  end

  alias each_orig each
  alias each_hash_orig each_hash
  
  def each(&block)
    each_orig do |row|
      yield row.map {|col| encode(col) }
    end
  end
#  alias each each_utf8

  def each_hash(&block)
    each_hash_orig do |row|
      row.each {|k, v| row[k] = encode(v) }
      yield(row)
    end
  end
#  alias each_hash each_hash_utf8
end

