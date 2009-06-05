#!/opt/local/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'
 
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

alias :e :exit

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  # ri 'Array#pop'
  # Array.ri
  # Array.ri :pop
  # arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

module Kernel
  # Copy the last n lines (or history back to matching the string/regex) with
  # the option to have the value appending # => <value> appended
  def pb(options={})
    opts = {:lines => 1, :include_value => false}.merge!(options)
    h = Readline::HISTORY.to_a
    IO.popen('pbcopy', 'w') { |io|
      case opts[:lines]
        when Integer
          io.write(h.last(opts[:lines]+1).first(opts[:lines]).join("\n"))
        when String, Regexp
          m = []
          found = h.reverse_each { |line|
            m << line
            break true if opts[:lines] === line
          }
          return "not found" unless found == true
          io.write(m.reverse.join("\n"))
      end
      io.write(opts[:include_value] ? " # => #{IRB.CurrentContext.last_value.inspect}" : "\n")
    }
  end

  module_function :pb
end
 
load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']