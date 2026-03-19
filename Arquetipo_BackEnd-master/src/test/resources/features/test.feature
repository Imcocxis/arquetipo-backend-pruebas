Feature: Entrenamiento Backend

  @prueba
  Scenario: Obtener información de usuario
    Given url 'https://jsonplaceholder.typicode.com/posts'
    When method get
    Then status 200


  @prueba_1
  Scenario: Llamada a escenario @prueba y validación de ID

    * def respuestaPrimerEscenario = call read('test.feature@prueba')
    * def idRecuperado = respuestaPrimerEscenario.response[0].id
    * print 'El ID recuperado de la posición 0 es:', idRecuperado
    Given url 'https://jsonplaceholder.typicode.com/posts/' + idRecuperado
    When method get
    Then status 200
    And match response.title == '#string'
    And match response.body == '#string'

 @pokemon
 Scenario: traer datos solicitados de Charmander
   Given url 'https://pokeapi.co/api/v2/pokemon/charmander'
   When method get
   Then status 200
   * def pokemonId = response.id
   * def pokemonName = response.name
   * def pokemonType = response.types[0].type.name
   * def pokemonHeight = response.height
   * def pokemonWeight = response.weight
   Given url response.species.url
   When method get
   * def evolutionChainUrl = response.evolution_chain.url
   Given url evolutionChainUrl
   When method get
   * def evolutionLevel = response.chain.evolves_to[0].evolution_details[0].min_level
   * print 'a. N° de pokemon:' , pokemonId
   * print 'b. Nombre:', pokemonName
   * print 'c. Tipo:', pokemonType
   * print 'd. Nivel en que Evoluciona:', evolutionLevel
   * print 'e. Altura:', pokemonHeight
   * print 'f. Peso:', pokemonWeight