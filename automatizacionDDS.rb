# frozen_string_literal: true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for:chrome

sleep 1

#ir a tal URL
driver.get "http://localhost:8080/login"
sleep 1


##Probar boton register de login
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab , :tab , :tab , :tab , :tab).perform

sleep 1
# Presiona "Enter"
driver.action.send_keys(:enter).perform



##Completar datos de Register
campo1 = driver.find_element(:id, 'firstName')
campo1.send_keys('Lucas')
sleep 1

campo2 = driver.find_element(:id, 'lastName')
campo2.send_keys('Lopez')
sleep 1

campo3 = driver.find_element(:id, 'email')
campo3.send_keys('lucaslopez@gmail.com')
sleep 1

campo4 = driver.find_element(:id, 'numero')
campo4.send_keys('1515151515')
sleep 1

campo5 = driver.find_element(:id, 'password')
campo5.send_keys('Lucaslopez123@@@')
sleep 1

# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab).perform

sleep 1
# Presiona "Enter"
driver.action.send_keys(:enter).perform


sleep 2




###Ir a Index
# Envía "Tab"
driver.action.send_keys(:tab).perform
sleep 1

# Presiona "Enter"
driver.action.send_keys(:enter).perform
sleep 3


###Ir a Login
driver.action.send_keys(:tab, :tab, :tab).perform
sleep 1
driver.action.send_keys(:enter).perform
sleep 1


sleep 1

###Loguearse
# Encuentra el primer campo de texto por su identificador, nombre, XPath, u otro selector
primer_campo = driver.find_element(:id, 'username')
primer_campo.send_keys('lucaslopez@gmail.com')
sleep 1
# Encuentra el segundo campo de texto por su identificador, nombre, XPath, u otro selector
segundo_campo = driver.find_element(:id, 'password')
segundo_campo.send_keys('Lucaslopez123@@@', :enter)

sleep 2






### Entrar en users
sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab).perform

sleep 1
# Presiona "Enter"
driver.action.send_keys(:enter).perform



### Entrar en Profile
sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab, :tab).perform

sleep 1
# Presiona "Enter"
driver.action.send_keys(:enter).perform



### Entrar en communities
sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab).perform

sleep 1
driver.action.send_keys(:enter).perform


### Entrar en ADD Incident
sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab, :tab, :tab, :tab).perform

sleep 1
# Presiona "Enter"
driver.action.send_keys(:enter).perform


##Completar datos de Register
campo11 = driver.find_element(:id, 'observation')
campo11.send_keys('se rompio el baño upsi')
sleep 1

campo12 = driver.find_element(:id, 'Service')
campo12.send_keys('1')
sleep 1

campo13 = driver.find_element(:id, 'tipo_incidente')
campo13.send_keys('1')
sleep 1


### Entrar en Lista de incidentes
sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab).perform

sleep 1
driver.action.send_keys(:enter).perform


### Desloguearse
sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab, :tab, :tab, :tab).perform

sleep 1
driver.action.send_keys(:enter).perform


sleep 1
#cerrar pagina
driver.quit