def main(adn1,adn2)
  adn1_upper = adn1.upcase
  adn2_upper = adn2.upcase

  distance = 0

  len = adn1_upper.length

  if adn1_upper.length == adn2_upper.length
    i = 0
    while i < len
      if adn1_upper[i] != adn2_upper[i]
        distance += 1
       end
       i += 1
    end

    return distance

  else
    puts "Les deux ADN ne sont pas de meme longeur !"
    return -1
  end

end

puts main("GAGCCTACTAACGGGAT","CATCGTAATyACGGCCT")