Feature: Pagination Payment processing Kals
  As a Finance User
  I would like the Payment Processing page to have pagination
  so that I can better manage the view of Payments and their statuses

  Background:
    Given I login with the "Super User" role

  @MCC206389_10
  Scenario: Pagination is present on the payment processing page
    Given I have "1" payments
    When I navigate to "Study Related Payment Processing Update Multiple Records" page using the menu
    Then I should see the 'per page' drop down with values:
      | 10  |
      | 20  |
      | 50  |
      | 100 |

  @MCC206389_20 @MCC200234
  Scenario: Results should show according to pagination selection
    Given I have "101" payments
    When I navigate to "Study Related Payment Processing Update Mcords" page using the menu
    Then I should see "50" rows
    And I should be on page "1" of "3"
    When I click "Next" page
    Then I should be on page "2" of "3"
    When I click "Last" page
    Then I should be on page "3" of "3"
    When I click "Previous" page
    Then I should be on page "2" of "3"
    When I click "First" page
    Then I should be on page "1" of "3"
    When I set "20" per page
    Then I should see "20" rows
    And I should be on page "1" of "9"

  @MCC210225_10 @MCC200234
  Scenario: Payments on the second page of "Study Related Payment Approvals - Update - Multiple Records"
  page should be successfully approved
    Given I have "52" payments awaiting approval
    And I navigate to "Study Related Payment Approvals - Update - Multiple Records" page using the menu
    And I select show all studies
    When I click "Next" page
    And I select and approve the second payment
    Then the payment should be approved without any errors
