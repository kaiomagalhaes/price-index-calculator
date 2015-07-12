$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'price/index/calculator'
require 'price/index/laspeyres'
require 'json'

def get_json(path)
  file = File.open(path, "rb")
  contents = file.read
  file.close
  JSON.parse(contents)
end
