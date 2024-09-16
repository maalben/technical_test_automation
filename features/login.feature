Feature: Autenticarse dentro del sistema

  @CP01001
  Scenario: Autenticarse de manera exitosa
    Given Yo ingreso al sitio web
    When Yo accedo al sistema con usuario "testuser" y password "testpassword"
    And Yo deberia ver el titulo "Financial Overview"

  @CP01002
  Scenario: Validar campos vacios en formulario de autenticacion
    Given Yo ingreso al sitio web
    When Yo accedo al sistema sin ingresar ningun dato en los campos
    And Yo deberia ver el mensaje "Please enter both username and password"

  @CP01003
  Scenario: Validar acceso si solo se ingresa el password
    Given Yo ingreso al sitio web
    When Yo accedo al sistema colocando el password "testpassword"
    And Yo deberia ver el mensaje "Username must be present"

  @CP01004
  Scenario: Validar acceso si solo se ingresa el usuario
    Given Yo ingreso al sitio web
    When Yo accedo al sistema colocando el usuario "testuser"
    And Yo deberia encontrar un mensaje con texto "Password must be present"

  @CP01005
  Scenario: Validar contraseña incorrecta
    Given Yo ingreso al sitio web
    When Yo accedo al sistema con usuario "testuser" y password "testuser"
    And Yo deberia ver el mensaje "Wrong username or password"