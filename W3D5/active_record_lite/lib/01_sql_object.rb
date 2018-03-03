require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    @columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        cats
    SQL
    @columns[0].map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method("#{col}=") do |val|
        # instance_variable_set("#{@attributes[col]}", val)
        attributes[col] = val
      end

      define_method("#{col}") do
        # instance_variable_get("#{@attributes[col]}")
        attributes[col]
      end

    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name

  end

  def self.table_name
    # ...
    @table_name = "#{self.name.downcase}s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # # ...
    params.each do |k, v|
       
    end


  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...

  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
