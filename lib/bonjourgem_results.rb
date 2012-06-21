require 'bonjourgem_results/version'
require 'nokogiri'
require 'open-uri'
require 'slop'
require 'colorize'
require "parser/bonjourgem_parser"

module BonjourgemResults
  
  def run
    opts = Slop.parse do 
      on '-g', :gem= , 'Single gem name'
      on '-l', :list=, 'Path to a file contain list of gems separated by \\n'
      on :h, :help   , 'Print this help message', :tail => true do
        puts help
        exit
      end
    end
    
    bonjourgem = BonjourgemParser.new opts
    bonjourgem.process
  end
  
end

#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-
# require 'nokogiri'
# require 'open-uri'

#def already_covered?(gem)
#  doc = Nokogiri::HTML(open("https://www.google.fr/search?q=#{gem}+site%3Abonjourgem.com"))
#  return !doc.css('h3.r a').empty?
#end

#unless ARGV.length == 1
#  puts "Usage : bonjourgem-results.rb <file|name>"
#  puts "file is a list of gems separated by \\n"
#  exit
#end
#
#arg = ARGV[0]
#if (File.exists?(arg))
#  f = File.open(arg, 'r')
#  f.each_line do |line|
#    line.strip!
#    next if line.empty?
#    puts "#{line} : #{already_covered?(line).inspect}"
#  end
#else
#  puts already_covered?(arg).inspect
#end