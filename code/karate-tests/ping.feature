Feature: Ping API

  Background:
    * configure printEnabled = true
    * configure url = baseUrl

  Scenario: GET /api/v1/ping returns status ok
    * configure retry = { count: 30, interval: 2000 }
    Given path '/api/v1/ping'
    Then retry until responseStatus == 200
    When method get
    Then status 200
    And match response == { status: 'ok', description: 'Ping Service' }

