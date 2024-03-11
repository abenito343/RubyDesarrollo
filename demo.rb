# frozen_string_literal: true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

sleep 1

#ir a tal URL
driver.get "http://google.com"

sleep 1

#navegar a tal URL
driver.navigate.to "http://google.com.ar"

sleep 1

#poner en consola la url actual
puts driver.current_url

sleep 1

#referescar pagina
driver.navigate.refresh

sleep 1

driver.manage.window.maximize
sleep 1

#poner en consola el titulo de la pagina actual
puts "Page title is #{driver.title}"

#no entendi xd
#driver.find_element(:tag_name,"body").send_keys "\uE00F"

#supuestamente creaba una pesataña y despues cambiaba de pestaña
#driver.keyboard.send_keys [:control,"t"]
#driver.keyboard.send_keys [:control,:tab]

sleep 1

#crea un elemento
element = driver.find_element(name: 'q')

sleep 1

#manda texto
element.send_keys "Hello WebDriver!"
#manda ENTER
element.submit

sleep 5

#driver.action.key_down(:control).perform
#
# Abre una nueva pestaña utilizando JavaScript
driver.execute_script("window.open('', '_blank');")


sleep 1
# Cambia el enfoque a la nueva pestaña
driver.switch_to.window(driver.window_handles.last)


sleep 1

# Visita una URL en la nueva pestaña (por ejemplo)
driver.get('https://sanlorenzo.com.ar/')


#element.send_keys

sleep 5


#cerrar pagina
driver.quit