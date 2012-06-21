# Based on https://github.com/msadouni/bonjourgem-results

class BonjourgemParser
  
  def initialize(opts)
    @file = opts[:l] || false
    @gem  = opts[:g] || false
  end
  
  def process
    if @file
      if (File.exists?(@file))
        f = File.open(@file, 'r')
        f.each_line do |line|
          line.strip!
          next if line.empty?
          already_covered?(line).inspect
        end
      else
        puts "There is no file here".red
        exit
      end
    elsif @gem
      already_covered?(@gem).inspect
    end
  end
  
  def output_result(text, bool)
    if bool
      puts "#{text} : already covered !".red
    else
      puts "#{text} : not covered atm".green
    end
  end
  
  def already_covered?(gem)
    gem_encode = URI::encode(gem)
    doc        = Nokogiri::HTML(open("https://www.google.fr/search?q=#{gem_encode}+site%3Abonjourgem.com"))
    output_result(gem, !doc.css('h3.r a').empty?)
  end
  
end