
require 'ropencc'

def s2t str
  Ropencc.conv('s2t.json', str)
end

def t2s str
  Ropencc.conv('t2s.json', str)
end
