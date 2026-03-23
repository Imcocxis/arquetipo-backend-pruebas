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




  @pokemon_evolution
  Scenario Outline: Traer datos de <pokemon_name> y sus siguientes dos evoluciones

    Given url 'https://pokeapi.co/api/v2/pokemon/' + '<pokemon_name>'
    When method get
    Then status 200
    * def p1_id = response.id
    * def p1_name = response.name
    * def p1_type = response.types[0].type.name
    * def p1_height = response.height
    * def p1_weight = response.weight
    * def p2_id = p1_id + 1
    Given url 'https://pokeapi.co/api/v2/pokemon/' + p2_id
    When method get
    Then status 200
    * def p2_name = response.name
    * def p2_type = response.types[0].type.name[0]
    * def p2_height = response.height
    * def p2_weight = response.weight
    * def p3_id = p2_id + 1
    Given url 'https://pokeapi.co/api/v2/pokemon/' + p3_id
    When method get
    Then status 200
    * def p3_name = response.name
    * def p3_type = response.types[0].type.name
    * def p3_height = response.height
    * def p3_weight = response.weight


    * print '--- RESULTADOS ---'
    * print 'BASE:', p1_id, p1_name, p1_type
    * print 'EVO 1:', p2_id, p2_name, p2_type
    * print 'EVO 2:', p3_id, p3_name, p3_type

    Examples:
      | pokemon_name |
      | charmander   |