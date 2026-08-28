require_relative '../../lib/ruby_gems_api_client'
require_relative '../spec_helper'

RSpec.describe RubyGemsApiClient do
  it 'returns gem data for show' do
  connection = double('FaradayConnection')
  response = double('FaradayResponse')

  allow(response).to receive(:body)
                       .and_return('{"name":"rails","info":"A web framework"}')
  allow(connection).to receive(:get)
                         .with('/api/v1/gems/rails.json')
                         .and_return(response)
  client = RubyGemsApiClient.new(connection)
  result=client.show('rails')

  expect(result.name).to eq('rails')
  expect(result.info).to eq('A web framework')
  end

  it 'return gem data list for search'do

    connection = double('FaradayConnection')
    response = double('FaradayResponse')

    json = <<~JSON
  [
    {"name":"rails","info":"Framework"},
    {"name":"rails-html-sanitizer","info":"HTML sanitizer"}
  ]
JSON

    allow(response).to receive(:body)
                         .and_return(json)
    allow(connection).to receive(:get)
                           .with('/api/v1/search.json',query:'rails')
                           .and_return(response)

    client = RubyGemsApiClient.new(connection)
    result=client.search('rails')

    expect(result.length).to eq(2)
    expect(result[0].name).to eq('rails')
    expect(result[1].name).to eq('rails-html-sanitizer')
  end
  end