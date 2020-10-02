Feature: As Nasa
         In order to observer mars
         I should be able to direct my rover

  Scenario: First
    Given There is a rover at position "2 2 N"
    And Nasa sends the command "M R M R"
    Then The rover position should be "3 3 S"

  Scenario: Second
    Given There is a rover at position "2 2 N"
    And Nasa sends the command "M R M R"
    Then The rover position should be "3 3 W"

  Scenario: Third
    Given There is a rover at position "2 2 N"
    And Nasa sends the command "M R M R"
    Then The rover position should be "3 3 S"


  Scenario: Fourth
    Given There is a rover at position "2 2 N"
    And Nasa sends the command "M R M R"
    Then The rover position should be "3 3 S"


#  Scenario:
#    Given There is a rover at position "2 2 N"
#    And the limit of pleatu is "10, 10"
#    And Nasa sends the command "M M M M M M M M M M M M M M M M M M"
#    Then The rover should say "I am going to get lost"