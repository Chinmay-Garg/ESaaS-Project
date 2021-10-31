Feature: creating a new room

  As a user of Columbia Chat
  I have developed a new interest but I cannot find a group for this hobby
  I want to create a new group and want to ensure that it is visible to everyone else.

  Background: rooms have been created on database

    Given the following rooms exist:
      | name                      | is_private
      | Food Lovers               | false
      | music                     | false
      | ice skating               | false
      | halloween party           | false

    And I am on the ColumbiaChat home page
    Then I should have options to send messages to "halloween party", "music", "ice skating", "Food lovers"

    Scenario: I create a new group for "Equestrian"
      Given the following users exist:
        | username                  | email                    | password     |
        | Umang_Raj                 | ur1236@columbia.edu      | Lol@123      |
        | Chinmay_Garg              | cg3286@columbia.edu      | Password@123 |
        | Harrison_Groll            | hsg2136@columbia.edu     | Lol@321      |
        | Sounak_Ray                | sr3846@columbia.edu      | Password@321 |
      When I am logged in as "Umang_Raj"
      And I create a new room for "Equestrian"
      Then "Chinmay_Garg" should see a new room named "Equestrian"
      And "Sounak_Ray" should see a new room named "Equestrian"
      And "Harrison_Groll" should see a new room named "Equestrian"
      And "Chinmay_Garg" should not see a new room named "Equestrian Horse Riding"
      And "Sounak_Ray" should not see a new room named "Equestrian Columbia"
      And "Harrison_Groll" should not see a new room named "Equestrian Olympics"