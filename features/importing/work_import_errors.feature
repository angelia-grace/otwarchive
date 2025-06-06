@works
Feature: Import Works
  In order to have an archive full of works
  As an author
  I want to create new works by importing them

  Scenario: Entering a bogus URL
    Given basic tags
      And I set up importing with a mock website
      And I am logged in as a random user
    When I go to the import page
      And I fill in "urls" with "http://no-content"
      And I select "English" from "Choose a language"
      And I press "Import"
    Then I should see "We couldn't successfully import that work, sorry: We couldn't download anything from http://no-content. Please make sure that the URL is correct and complete, and try again."
    When I follow "My Dashboard"
    Then I should see "Drafts (0)"

  Scenario: Cannot import works from the current archive
    Given I set up importing
      And I fill in "urls" with "https://archiveofourown.org/works/54711364"
      And I select "English" from "Choose a language"
    And I press "Import"
    Then I should see "We couldn't successfully import that work, sorry: URL is for a work on the Archive. Please bookmark it directly instead."
    When I follow "My Dashboard"
    Then I should see "Drafts (0)"
