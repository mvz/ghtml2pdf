Feature: Command Line Errors
  As a user
  In order to see what I'm doing wrong
  I want to get a useful message

  Scenario: Forgetting the input file
    When I run `ghtml2pdf`
    Then it should fail with exactly:
      """
      An input filename is required
      """
