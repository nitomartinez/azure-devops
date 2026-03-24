Feature: Ping API

  Scenario: GET /api/v1/ping returns status ok
    Given url 'http://localhost:8080/api/v1/ping'
    When method get
    Then status 200
    And match response == { status: 'ok', description: 'Ping Service' }