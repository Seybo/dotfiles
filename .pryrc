# frozen_string_literal: true
if defined?(::Bundler)
  current_gemset = ENV['GEM_HOME']
  $LOAD_PATH.concat(Dir.glob("#{current_gemset}/gems/*/lib")) if current_gemset
end

require 'pry-stack_explorer'

# fzf in pry
# breaks vi-mode :(
# require 'rb-readline'
# require 'readline'
# if defined?(RbReadline)
#   def RbReadline.rl_reverse_search_history(sign, key)
#     rl_insert_text  `cat ~/.pry_history | fzf --tac |  tr '\n' ' '`
#   end
# end

Pry::Commands.block_command 'noconflict', 'Rename step to sstep and next to nnext' do
  Pry::Commands.rename_command('nnext', 'next')
  Pry::Commands.rename_command('bbreak', 'break')
end

Pry::Commands.block_command 'unnoconflict', 'Revert to normal next and break' do
  Pry::Commands.rename_command('next', 'nnext')
  Pry::Commands.rename_command('break', 'bbreak')
end

## Useful Collections

def a_array
  (1..6).to_a
end

def a_hash
  { hello: 'world', free: 'of charge' }
end

## Benchmarking
# Inspired by <http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834>.

def do_time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm { |b| b.report { repetitions.times(&block) } }
end

Pry.config.color = true

Pry.config.commands.alias_command 'h', 'hist -T 20', desc: 'Last 20 commands'
Pry.config.commands.alias_command 'hg', 'hist -T 20 -G', desc: 'Up to 20 commands matching expression'
Pry.config.commands.alias_command 'hG', 'hist -G', desc: 'Commands matching expression ever used'
Pry.config.commands.alias_command 'hr', 'hist -r', desc: 'hist -r <command number> to run a command'

if defined?(PryByebug)
  def pry_debug
    puts 'You can also call ‘pd’ to save typing!'
    pd
  end

  # Shortcut for calling pry_debug
  def pd # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    Pry.commands.alias_command 'ss', 'show-stack'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 'f', 'finish'
    Pry.commands.alias_command 'u', 'up'
    Pry.commands.alias_command 'd', 'down'
    Pry.commands.alias_command 'b', 'break'
    Pry.commands.alias_command 'w', 'whereami'

    puts 'Debugging Shortcuts'
    puts 'w  :  whereami'
    puts 's  :  step'
    puts 'n  :  next'
    puts 'c  :  continue'
    puts 'f  :  finish'
    puts 'Stack movement'
    puts 'ss  :  show-stack'
    puts 'ff :  frame'
    puts 'u  :  up'
    puts 'd  :  down'
    puts 'b  :  break'
    ''
  end

  def pry_rails
    puts 'You can also call ‘pr’ to save typing!'
    pr
  end

  # Shortcut for calling pry_debug
  def pr
    # Seems these are now loaded automatically in newer Rails
    # require "factory_bot";
    # FactoryBot.find_definitions
    puts 'Added factory support'
  end

  # Longer shortcuts
  Pry.commands.alias_command 'ff', 'frame'

  Pry.commands.alias_command 'sss', 'show-stack'
  Pry.commands.alias_command 'ss', 'step'
  Pry.commands.alias_command 'nn', 'next'
  Pry.commands.alias_command 'cc', 'continue'
  Pry.commands.alias_command 'fin', 'finish'
  Pry.commands.alias_command 'uu', 'up'
  Pry.commands.alias_command 'dd', 'down'
  Pry.commands.alias_command 'bb', 'break'
  Pry.commands.alias_command 'ww', 'whereami'
end

pry_debug if defined?(::Rails) && Rails.env && Rails.env.test? && ENV['PRY_LONG'].blank?

my_hook = Pry::Hooks.new.add_hook(:before_session, :add_dirs_to_load_path) do
  # adds the directories /spec and /test directories to the path if they exist and not already included
  dir = `pwd`.chomp
  dirs_added = []
  %w[spec test presenters lib].map { |d| "#{dir}/#{d}" }.each do |p|
    if File.exist?(p) && !$LOAD_PATH.include?(p)
      $LOAD_PATH << p
      dirs_added << p
    end
  end
  puts "Added #{dirs_added.join(', ')} to load path in ~/.pryrc." if dirs_added.present?
end

# Hit Enter to repeat last command
# Pry::Commands.command(/^$/, 'repeat last command') do
#   _pry_.run_command Pry.history.to_a.last
# end

my_hook.exec_hook(:before_session)

puts 'Loaded ~/.pryrc'
puts

def more_help # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  puts 'Helpful shortcuts:'
  puts 'hh  : hist -T 20       Last 20 commands'
  puts 'hg : hist -T 20 -G    Up to 20 commands matching expression'
  puts 'hG : hist -G          Commands matching expression ever used'
  puts 'hr : hist -r          hist -r <command number> to run a command'
  puts

  puts 'Samples variables'
  puts 'a_array  :  [1, 2, 3, 4, 5, 6]'
  puts 'a_hash   :  { hello: "world", free: "of charge" }'
  puts
  puts 'helper   : Access Rails helpers'
  puts 'app      : Access url_helpers'
  puts
  puts 'require "rails_helper"              : To include Factory Girl Syntax'
  puts 'include FactoryGirl::Syntax::Methods  : To include Factory Girl Syntax'
  puts
  puts 'or if you defined one...'
  puts 'require "pry_helper"'
  puts
  puts 'Sidekiq::Queue.new.clear              : To clear sidekiq'
  puts 'Sidekiq.redis { |r| puts r.flushall } : Another clear of sidekiq'
  puts
  puts 'Debugging Shortcuts'
  puts 'ss  :  step'
  puts 'nn  :  next'
  puts 'cc  :  continue'
  puts 'fin :  finish'
  puts 'uu  :  up'
  puts 'dd  :  down'
  puts 'bb  :  break'
  puts 'ww  :  whereami'
  puts 'ff  :  frame'
  puts 'sss :  show-stack'
  puts '$   :  show whole method of context'
  puts
  puts 'Run ‘pry_debug’ or ‘pd’ to display shorter debug shortcuts'
  puts 'Run ‘pry_rails’ or ‘pr’ run rails helpers'
  puts "Run `require 'factory_girl'; FactoryBot.find_definitions` for FactoryBot"
  ''
end
puts 'Run ‘more_help’ to see tips'

# Projects related
project_helpers = File.join Dir.getwd, '_mydev', 'pry_helpers.rb'
require project_helpers if File.exist?(project_helpers)
