require_relative 'ruby_gems_api_client'
require_relative 'program_result'

class Program
  def initialize(api_client,arguments)
    @api_client=api_client
    @arguments=arguments
  end

  def run
    case @arguments[0]
    when 'show'
      return ProgramResult.new('No argument after show',1) if @arguments[1].nil?

      gem = @api_client.show(@arguments[1])
      output = "Name: #{gem.name}\nInfo: #{gem.info}"
      ProgramResult.new(output,0)
    when 'search'
      return ProgramResult.new('No argument after search',1) if @arguments[1].nil?

      gems = @api_client.search(@arguments[1])
      lines= gems.map do |gem|
        "#{gem.name} - #{gem.info}"

      end
      ProgramResult.new(lines.join("\n"),0)
    else
              ProgramResult.new('Invalid command',1)
    end
  end
end

