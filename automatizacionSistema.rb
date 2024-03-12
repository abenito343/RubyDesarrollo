# frozen_string_literal: true
require 'selenium-webdriver'

#driver.action.send_keys(:tab,:tab,:enter).perform
def mandarTeclas(driver, *keys)
  keys.each { |key| driver.action.send_keys(key).perform }
end

#campo1 = driver.find_element(:id, 'firstName')
#campo1.send_keys('Lucas')
def rellenarCampo(driver, id, *keys)
  campo = driver.find_element(:id, id)
  keys.each { |key| campo.send_keys(key) }
end

class VerificadorPantalla
  def initialize(driver)
    @driver = driver
  end
  def verificar_pantalla(expected_url)
    actual_url = @driver.current_url
    if actual_url == expected_url
      puts "Estás en la pantalla '#{expected_url}'. Verificación exitosa."
    else
      puts "Error: No estás en la pantalla esperada. URL actual: '#{actual_url}'."
      @driver.quit
    end
  end
end

class Pantalla
  attr_reader :url
  def initialize(driver)
    @driver = driver
    @url = nil
  end
  def visit
    @driver.get(@url)
  end
end

class LoginPage < Pantalla
  def initialize(driver)
    super(driver) # Llama al constructor de la clase padre
    @url = 'http://localhost:8080/login' # Establece la URL de la página de inicio de sesión
  end
  def login(username, password)
    rellenarCampo(@driver, 'username', username)
    sleep 1
    rellenarCampo(@driver, 'password', password)
    sleep 1
    mandarTeclas(@driver, :enter)
    sleep 1
  end
end

class RegisterPage < Pantalla
  def initialize(driver)
    super(driver) # Llama al constructor de la clase padre
    @url = 'http://localhost:8080/register' # Establece la URL de la página de registro
  end
  def register_user(first_name, last_name, email, phone, password)
    rellenarCampo(@driver, 'firstName', first_name)
    sleep 1
    rellenarCampo(@driver, 'lastName', last_name)
    sleep 1
    rellenarCampo(@driver, 'email', email)
    sleep 1
    rellenarCampo(@driver, 'numero', phone)
    sleep 1
    rellenarCampo(@driver, 'password', password)
    sleep 1
    #mandarTeclas(@driver, :enter)
  end
end

class AddIncidentPage < Pantalla
  def initialize(driver)
    super(driver) # Llama al constructor de la clase padre
    @url = 'http://localhost:8080/communities/1/incidente/save' # Establece la URL de la página para agregar incidentes
  end
  def addIncident(observation, service, tipo_incidente)
    rellenarCampo(@driver, 'observation', observation)
    sleep 1
    rellenarCampo(@driver, 'Service', service)
    sleep 1
    rellenarCampo(@driver, 'tipo_incidente', tipo_incidente)
    sleep 1
  end
end


driver = Selenium::WebDriver.for :chrome

login_page = LoginPage.new(driver)
register_page = RegisterPage.new(driver)
add_incident_page = AddIncidentPage.new(driver)
verificador = VerificadorPantalla.new(driver)

# Lee los valores desde el archivo
file_path = 'parametros.txt'
lines = File.readlines(file_path).map(&:strip)
# Asigna los valores a las variables correspondientes
login_email, login_password, first_name, last_name, email, phone, register_password, incident_observation, service, tipo_incidente = lines

sleep 1
### Ir a tal URL (login)
driver.get login_page.url
sleep 1
#Maximizar ventana
driver.manage.window.maximize
sleep 1

### Entrar en register (usando boton en pantalla)
mandarTeclas(driver, :tab, :tab, :tab, :tab, :tab, :tab, :enter)
sleep 1

##Verificar Pantalla
verificador.verificar_pantalla(register_page.url)

### Completar datos de Register
register_page.register_user(first_name, last_name, email, phone, register_password)
sleep 1

### Entrar en login (usando boton en pantalla)
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Entrar en Index (usando boton en pantalla)
mandarTeclas(driver,:tab, :enter)
sleep 1

### Entrar en Login
mandarTeclas(driver,:tab, :tab, :tab, :enter)
sleep 1

##Verificar Pantalla
verificador.verificar_pantalla(login_page.url)

### Loguearse
login_page.login(login_email, login_password)
sleep 1

### Entrar en users (usando boton en pantalla)
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Entrar en Profile (usando boton en pantalla)
mandarTeclas(driver,:tab, :tab, :tab, :enter)

### Entrar en communities (usando boton en pantalla)
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Entrar en ADD Incident (usando boton en pantalla)
mandarTeclas(driver, :tab, :tab, :tab, :tab, :tab, :enter)
sleep 1

##Verificar Pantalla
verificador.verificar_pantalla(add_incident_page.url)

### Completar datos de ADD Incident
add_incident_page.addIncident(incident_observation, service, tipo_incidente)
sleep 1

### Entrar en Lista de incidentes (usando boton en pantalla)
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Desloguearse
mandarTeclas(driver, :tab, :tab, :tab, :tab, :tab, :enter)
sleep 1

### Cerrar pagina
driver.quit