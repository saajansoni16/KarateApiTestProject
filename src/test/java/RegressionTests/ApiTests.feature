Feature: Api Add/update/create and delete calls - CRUD

  Background:
    Given url baseUrl

  @CreateUser
  Scenario: Create User request test
    And path '/api/users/'
    And request {'name': 'morpheus', 'job': 'leader'}
    And method post
    Then status 201
    And match response $.name == 'morpheus'
    And match response.job == 'leader'
    And match response.id != ''

  Scenario: Get recently created id and validate
    #* def result = call read('ApiTests.feature@CreateUser')
    #* def userId = result.response.id
    And path '/api/users/' + 1
    And method get
    Then status 200
    And match response.data.id == 1

  Scenario: Update existing user and validate
    #* def result = call read('ApiTests.feature@CreateUser')
    #* def userId = result.response.id
    And path '/api/users/' + 1
    And request {'name': 'New morpheus', 'job': 'Engineer'}
    And method put
    Then status 200
    And match response $.name == 'New morpheus'
    And match response.job == 'Engineer'

  Scenario: Delete existing user and validate
    #* def result = call read('ApiTests.feature@CreateUser')
    #* def userId = result.response.id
    And path '/api/users/' + 1
    And method delete
    Then status 204