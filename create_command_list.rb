#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'json'

#wget 'http://lpn.rnbhq.org/tools/xemacs/emacs_ref.html'
@lines = []
open('emacs_ref.html') {|f|
  while text = f.gets
    @lines << text
  end
}

@table = []
# puts @lines
@lines.each do |line|
  if line.start_with?("<code>")
    # puts line
    #p line.scan(/<code>(\S)/)
    temp = line[6..-6].split('  </code>')
    if temp[0] == "M-{"
      temp[1] = "change to the previous file marked with * od D"
    end
    if temp[0].start_with?("C") or temp[0].start_with?("M")
      @table << {"cmd" => temp[0], "desc" => temp[1]} 
    end
  end
end

open('command-list.json', 'w') {|f|
  f.puts JSON.pretty_generate @table
}

