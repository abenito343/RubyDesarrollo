# frozen_string_literal: true

# login_system.rb

class LoginSystem
  def initialize
    @users = {}
    @logged_in_user = nil
  end

  def register(username, password)
    @users[username] = password
  end

  def login(username, password)
    if @users.key?(username) && @users[username] == password
      @logged_in_user = username
      puts "¡Inicio de sesión exitoso! Bienvenido, #{@logged_in_user}."
    else
      puts "Nombre de usuario o contraseña incorrectos."
    end
  end

  def logout
    if @logged_in_user
      puts "Cierre de sesión exitoso. Adiós, #{@logged_in_user}!"
      @logged_in_user = nil
    else
      puts "No hay sesión activa."
    end
  end

  def show_logged_in_user
    if @logged_in_user
      puts "Usuario actualmente conectado: #{@logged_in_user}."
    else
      puts "Ningún usuario conectado."
    end
  end
end

# Ejemplo de uso
#login_system = LoginSystem.new
#
# # Registro de usuarios
# login_system.register("usuario1", "contrasena1")
# login_system.register("usuario2", "contrasena2")
#
# # Intento de inicio de sesión
# login_system.login("usuario1", "contrasena1")
#
# # Verificación del usuario conectado
# login_system.show_logged_in_user
#
# # Cierre de sesión
# login_system.logout


#Ejemplo de uso
login_system = LoginSystem.new

#Registro de usuarios
login_system.register("usuario1", "contrasena1")
login_system.register("usuario2", "contrasena2")


# Solicitar al usuario que ingrese su nombre de usuario
print "Ingrese su nombre de usuario: "
usuario = gets.chomp

# Solicitar al usuario que ingrese su contraseña
print "Ingrese su contraseña: "
contrasena = gets.chomp

# Llamar a la función de login con los valores ingresados por el usuario
login_system.login(usuario, contrasena)



#Verificación del usuario conectado
 login_system.show_logged_in_user

# # Cierre de sesión
 login_system.logout