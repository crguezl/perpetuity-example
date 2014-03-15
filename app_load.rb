require 'perpetuity'
require 'perpetuity/mongodb'
require 'pp'

Perpetuity.data_source :mongodb, 'my_perpetuity_database'

class Article
  attr_accessor :title, :body
  def to_s 
    "title: #{@title}\nbody: #{body}\n"
  end
end

Perpetuity.generate_mapper_for Article do
  attribute :title
  attribute :body
end

articles = Perpetuity[Article].all
articles.each do |article| # This is when the DB gets hit
  puts article
end

