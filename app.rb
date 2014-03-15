require 'perpetuity'
require 'perpetuity/mongodb'

Perpetuity.data_source :mongodb, 'my_perpetuity_database'

#Perpetuity.configure do 
#  data_source :mongodb 
#end


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

article = Article.new
article.title = 'New Article'
article.body = 'This is an article.'

Perpetuity[Article].insert article

puts article


