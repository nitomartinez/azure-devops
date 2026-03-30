Feature: Ping API

  Background:
    * configure printEnabled = true
    * configure url = baseUrl

  Scenario: GET /api/v1/ping returns status ok
    Given path '/api/v1/ping'
    When method get
    Then status 200
    And match response == { status: 'ok', description: 'Ping Service 2' }