begin $LOAD_PATH << '/home/glaux/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/awesome_print-1.8.0/lib/'
      require 'awesome_print'
      AwesomePrint.irb!
      puts 'awesome_print gem installed, enjoy :)'
rescue Loaderror => e
  puts 'no awesome_print :('
end