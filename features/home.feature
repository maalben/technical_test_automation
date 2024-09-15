Feature: Pagina principal Resumen financiero

  Background:
    Given Yo ingreso al sitio web
    When Yo accedo al sistema con usu ario "testuser" y password "testpassword"

  @CP02001
  Scenario: Validar que la pagina redirigida sea el home
    Then Yo deberia ser redirigido a la pagina de la tabla de gastos

  @CP02002
  Scenario: Validar cantidad de transacciones de la tabla
    Then Yo deberia ver exactamente 6 transacciones en la tabla

  @CP02003
  Scenario: Validar saldo total
    Then Yo deberia ver el saldo total de 350

  @CP02004
  Scenario: Validar credito disponible
    Then Yo deberia ver el credito disponible de "17,800"

  @CP02005
  Scenario Outline: Validar tipos de valores y colores
    When Yo deberia validar que todos los valores "<value_type>" deben ser de color "<color>"

    Examples:
      | value_type | color   |
      | positive   | #00ff00 |
      | negative   | #ff0000 |