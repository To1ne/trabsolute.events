require 'nokogiri'

# source: https://coderwall.com/p/d1vplg
def embedded_svg filename, options={}
  file = File.read(File.join('assets', filename))
  doc = Nokogiri::HTML::DocumentFragment.parse file
  svg = doc.at_css 'svg'
  if options.has_value?(:class)
    svg['class'] = options[:class]
  end
  svg
end

# inspired by http://www.wbwip.com/wbw/emailencoder.html
def email_encode address
  enc = ''
  address.chars do |c|
    enc << "\&##{c.ord};"
  end
  enc
end
