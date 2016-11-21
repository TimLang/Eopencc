
require 'ropencc'

def s2t str
  Ropencc.conv('s2t.json', str)
end

def t2s str
  Ropencc.conv('t2s.json', str)
end

def s2twp str
  Ropencc.conv('s2twp', str)
end

def tw2sp str
  Ropencc.conv('tw2sp', str)
end
