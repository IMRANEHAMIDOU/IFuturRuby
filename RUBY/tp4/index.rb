OPERATORS = ["plus", "moins","divisé","multiplié"]

def calculatrice(operation)

  if is_string(operation)
    puts "Désolé, expression n'est que du text !"
    return
  end

  operateur_trouver = []

  nombre_trouver = []

  ooperation = operation.split

  ooperation.each do |op|
    if OPERATORS.include?(op)
      operateur_trouver << op
    end
    if is_numeric(op)
      nombre_trouver << op.to_f
    end
  end

  #gestion des expressions incorrects
  if(operateur_trouver.size >= nombre_trouver.size)
    puts "Le nombre d'opérateurs doit etre strictement inférieur au nombre d'opérants !"
    return
  end
  if (nombre_trouver.size != operateur_trouver.size+1)
    puts "Vous avez un nombre insuffisant d'opérateurs dans votre expression !"
    return
  end
  expression = []
  nombre_trouver.each_with_index do |n,i|
    expression << n.to_f
    expression << operateur_trouver[i]
  end
  expression.pop

  # Démarrer avec la première valeur
  resultat = expression[0]

  #puts "Expressiom : #{expression.inspect}"
  # Parcourir le tableau et appliquer les opérations
  (1...expression.length).step(2) do |i|
    operateur = expression[i]
    nombre = expression[i + 1]
    case operateur
    when "plus"
      resultat += nombre
    when "moins"
      resultat -= nombre
    when "multiplié"
      resultat *= nombre
    when "divisé"
      resultat /= nombre
    end
  end
  #puts expression.inspect
  puts "La réponse est : #{resultat}"
end

def is_string(str)
  return !!str.match(/\A[a-zA-Z?.:!; ]+\z/)
end
def is_numeric(chaine)
  return !!(chaine =~ /\A[-+]?\d+(\.\d+)?\z/) 
end

exp = ""
loop do
  puts "Saisissez une expression telque : Que vaut 8 plus 10 ou tapper -1 pour arreter le programme"
  exp = gets.chomp
  break if exp == "-1"
  calculatrice(exp)
end



