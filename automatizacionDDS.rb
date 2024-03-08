# frozen_string_literal: true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for:chrome

sleep 1

#ir a tal URL
driver.get "http://localhost:8080/login"

sleep 1

# Encuentra el primer campo de texto por su identificador, nombre, XPath, u otro selector
primer_campo = driver.find_element(:id, 'username')
primer_campo.send_keys('lucaslopez@gmail.com')
sleep 1
# Encuentra el segundo campo de texto por su identificador, nombre, XPath, u otro selector
segundo_campo = driver.find_element(:id, 'password')
segundo_campo.send_keys('Lucaslopez123@@@', :enter)

sleep 2

# Encuentra el botón por su identificador, nombre, XPath, u otro selector        NO PUDE
#boton = driver.find_element(:id, 'navbarSupportedContent')
#boton.click

sleep 1
# Envía dos teclas "Tab"
driver.action.send_keys(:tab, :tab).perform

sleep 1
# Presiona "Enter"
driver.action.send_keys(:enter).perform



sleep 5
#cerrar pagina
driver.quit