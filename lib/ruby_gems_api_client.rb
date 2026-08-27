require 'faraday'
require 'json'
require_relative 'gem_data'


class RubyGemsApiClient
  def initialize
    @connection = Faraday.new(url:'https://rubygems.org')
  end

  def show(name)
    response = @connection.get("/api/v1/gems/#{name}.json")
    data=JSON.parse(response.body)

    GemData.new(data['name'],data['info'])
  end

  def search(keyword)
    response = @connection.get('/api/v1/search.json',query:keyword)
    data=JSON.parse(response.body)
    data.map do |gem|
      GemData.new(gem['name'],gem['info'])
    end
  end

end

