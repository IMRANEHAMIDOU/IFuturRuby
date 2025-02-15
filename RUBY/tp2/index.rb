SEPARATORS = [" ",".",":",",","?"]

def main(sentence)
  result = {}

  text = sentence.gsub(/[?,:.\/|]/, " ").downcase

  text.split.each do |word|
    result[word] = text.scan(word).size
  end

  return result

end

puts main("You come back, you hear me?")