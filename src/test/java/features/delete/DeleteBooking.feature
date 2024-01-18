Feature:HerokuApp - Delete call

 Background: consume service
    * url 'https://restful-booker.herokuapp.com/'
    * def authToken = call read('classpath:features/token/createToken.feature@CreateToken')
    * def create = call read('classpath:features/create/createBooking.feature@Create')

  Scenario: Delete restful booker herokuapp

    Given path 'booking/'
    And path create.id
    * header Accept = 'application/json'
    * header Cookie = 'token=' + authToken.Token
    And print authToken.accessToken
    When method DELETE
    Then status 201
