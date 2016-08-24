class users

@@users = []

  def add (user,name,lastname) #Crea hash con las caracteristicas del estudiante
      user = {
        user: user,
        name: name,
        lastname: lastname,
      }
  end

  def new #Pregunta al usuario para luego crear hash
      puts "Introduzca Usuario"
      user = gets.chomp
      puts "Introduzca Nombre"
      user = gets.chomp
      puts "Introduzca Apellido"
      lastname = gets.chomp
      @@users << add(user,name,lastname)
  end

end
