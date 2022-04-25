Feature: Mortgage calculator

  Scenario: Start browser and go to the link of the website
    When I open browser and go to the link
    Then Mortgage calculator page is opened

  Scenario: Page was correct loaded
    Then Mortgage calculator label is displayed
    Then By property value link is displayed
    Then By credit sum link is displayed
    Then Property value label is displayed
    Then Initial payment label is displayed
    Then Credit sum label is displayed
    Then Credit period label is displayed
    Then Interest rate label is displayed
    Then Payment type label is displayed

  Scenario: Down payment is correct
    Given I write property value
    Given I choose Down payment in percent
    Given I write down payment in percent
    Then The desired value appeared

  Scenario: Credit sum is correct
    Then The sum corresponds to the expected

  Scenario: Filling in the remaining fields
    Given I write credit period
    Given I generate random interest rate
    Given I write generated interest rate

  Scenario: Check that annuity payment is checked and diff payment is unchecked
    Then I check that annuity check box is checked
    Then I check that diff check box is unchecked

  Scenario: Settlements are displayed
    Given I click calculate button
    Then Canvas is displayed

  Scenario: Correct monthly payment is displayed
    Then Calculated monthly pay and monthly pay from the website are equals