class PidginSpec
  def self.describe(desc = nil, &block)
    puts desc
    new(&block)
  end

  attr_accessor :fail_count, :pass_count, :failure_messages, :passed, :spec_count
  def initialize(&block)
    @pass_count = 0
    @fail_count = 0
    @spec_count = 0
    @failure_messages = []
    instance_eval(&block) 
    puts "\n#{@spec_count} tests run, #{@fail_count} fail#{"\n\nFailures:\n" if fail_count.nonzero?}".send(@fail_count.zero? ? 'green' : 'red')
    @failure_messages.each_with_index {|m, index| 
      puts "#{index + 1}. #{m[:description]}\n#{"Wetin make am fail".red}: #{format(m[:failed_code])} \n #{m[:message].red}\n#{m[:failed_code_path].magenta}\n\n"
    }
  end

  def describe(des_statement, &block)
    ExampleGroup.new(des_statement, self, &block)
  end

  private

  def format(str)
    lexer = Rouge::Lexers::Ruby.new.lex(str)
    Rouge::Formatters::Terminal256.new.format(lexer)
  end
end

require "colorize"
require "rouge"
require 'require_all'
require_rel './pidgin_spec'
