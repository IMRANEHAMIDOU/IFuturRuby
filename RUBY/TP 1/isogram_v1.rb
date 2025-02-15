
def verif_isogram(mots)

    except = ['-'," "]

    letters = mots.downcase.chars
    
    letters.each do |lettre|
        nbre = 0
        letters.each do |l|
            if ! except.include?(l)
                if lettre==l
                    nbre += 1
                end
            end
        end
        if nbre> 1
            return false
        end
    end
    return true
end

mots = ""

loop do
    puts "Veuiller saisir un mot ou une phrase et si vous souhaitez arreter, saisissez -1"
    mots = gets.chomp()
    puts(verif_isogram(mots))
    break if mots == "-1"
end