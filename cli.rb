require_relative 'lib/program'

api_client = RubyGemsApiClient.new
program = Program.new(api_client,ARGV)

result = program.run

puts result.output
exit result.exit_code