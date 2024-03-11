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


def verificar_pantalla(driver,expected_title)
  actual_title = driver.current_url
  if actual_title == expected_title
    puts "Estás en la pantalla '#{expected_title}'. Verificación exitosa."
  else
    puts "Error: No estás en la pantalla esperada. Título actual: '#{actual_title}'."
    driver.quit
  end
end


class LoginPage
  def initialize(driver)
    @driver = driver
  end

  def visit
    @driver.get('http://localhost:8080/login')
  end

  def login(username, password)
    rellenarCampo(@driver,'username', 'lucaslopez@gmail.com')
    rellenarCampo(@driver,'password', 'Lucaslopez123@@@')
    mandarTeclas(@driver,:enter)
  end
end





driver = Selenium::WebDriver.for :chrome
sleep 1

### Ir a tal URL
driver.get "http://localhost:8080/login"
sleep 1
#maximizar
driver.manage.window.maximize
sleep 1

### Entrar en register
mandarTeclas(driver, :tab, :tab, :tab, :tab, :tab, :tab, :enter)
sleep 1

### Completar datos de Register
rellenarCampo(driver,'firstName','Lucas' )
sleep 1
rellenarCampo(driver,'lastName','Lopez' )
sleep 1
rellenarCampo(driver,'email','lucaslopez@gmail.com')
sleep 1
rellenarCampo(driver,'numero','1515151515')
sleep 1
rellenarCampo(driver,'password','Lucaslopez123@@@')
sleep 1

### Entrar en login
mandarTeclas(driver,:tab, :tab, :enter)
sleep 2

### Entrar en Index
mandarTeclas(driver,:tab, :enter)
sleep 3

### Entrar en Login
mandarTeclas(driver,:tab, :tab, :tab, :enter)
sleep 1

login_page = LoginPage.new(driver)
login_page.visit
login_page.login('lucaslopez@gmail.com', 'Lucaslopez123@@@')


###Loguearse
# Encuentra el primer campo de texto por su identificador, nombre, XPath, u otro selector
rellenarCampo(driver,'username','lucaslopez@gmail.com')
sleep 1
rellenarCampo(driver,'password','Lucaslopez123@@@')
mandarTeclas(driver,:enter)
sleep 2

### Entrar en users
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Entrar en Profile
mandarTeclas(driver,:tab, :tab, :tab, :enter)

### Entrar en communities
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Entrar en ADD Incident
mandarTeclas(driver, :tab, :tab, :tab, :tab, :tab, :enter)
sleep 1

### Completar datos de Register
rellenarCampo(driver,'observation','se rompio el baño upsi')
sleep 1
rellenarCampo(driver,'Service','1')
sleep 1
rellenarCampo(driver,'tipo_incidente','1')
sleep 1

### Entrar en Lista de incidentes
mandarTeclas(driver,:tab, :tab, :enter)
sleep 1

### Desloguearse
mandarTeclas(driver, :tab, :tab, :tab, :tab, :tab, :enter)
sleep 1

### Cerrar pagina
driver.quit