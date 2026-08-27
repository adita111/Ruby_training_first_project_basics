require_relative '../../lib/program'
require_relative '../spec_helper'

RSpec.describe Program do
  it 'returns invalid command for unknown command' do
    api_client = double('RubyGemsApiClient')
    program = Program.new(api_client, ['wrong'])

    result = program.run

    expect(result.output).to eq('Invalid command')
    expect(result.exit_code).to eq(1)
  end

  it 'returns error when show has no argument' do
    api_client = double('RubyGemsApiClient')
    program = Program.new(api_client, ['show'])

    result = program.run

    expect(result.output).to eq('No argument after show')
    expect(result.exit_code).to eq(1)
  end

  it 'returns error when search has no argument' do
    api_client = double('RubyGemsApiClient')
    program = Program.new(api_client, ['search'])

    result = program.run

    expect(result.output).to eq('No argument after search')
    expect(result.exit_code).to eq(1)
  end

  it 'shows gem information' do
    api_client = double('RubyGemsApiClient')
    gem = GemData.new('rails', 'A web framework')

    allow(api_client).to receive(:show)
                           .with('rails')
                           .and_return(gem)

    program = Program.new(api_client, ['show', 'rails'])

    result = program.run

    expect(result.output).to eq("Name: rails\nInfo: A web framework")
    expect(result.exit_code).to eq(0)
  end

  it 'searches gems by keyword' do
    api_client = double('RubyGemsApiClient')

    gem1 = GemData.new('rails', 'Framework')
    gem2 = GemData.new('rails-html-sanitizer', 'HTML sanitizer')

    allow(api_client).to receive(:search)
                           .with('rails')
                           .and_return([gem1, gem2])

    program = Program.new(api_client, ['search', 'rails'])

    result = program.run

    expected_output = "rails - Framework\nrails-html-sanitizer - HTML sanitizer"

    expect(result.output).to eq(expected_output)
    expect(result.exit_code).to eq(0)
  end
end