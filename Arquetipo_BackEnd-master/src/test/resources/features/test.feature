Feature:
  Background:
    * url servidor + artefacto + 'path'
    * def exp = read('classpath:features/funcion/data/data.json')

  Scenario: Titulo de Test Case
    Given request exp
    When method POST
    Then status 200