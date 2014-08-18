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
