Feature: As Nasa
         In order to observer mars
         I should be able to direct my rover

  Scenario:
    Given There is a rover at position "2 2 N"
    And Nasa sends the command "M R M R"
    Then The rover position should be "1 1 N"