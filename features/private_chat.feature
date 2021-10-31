Feature: sending message on a private chat

  As a user of Columbia Chat
  when I send a message on a chat intended for a specific member of the Columbia fraternity
  I want to ensure that only that person can see the message and not anyone else.

  Background: users have been added to database

    Given the following users exist:
      | username                  | email                    | password     |
      | Umang_Raj                 | ur1236@columbia.edu      | Lol@123      |
      | Chinmay_Garg              | cg3286@columbia.edu      | Password@123 |
      | Harrison_Groll            | hsg2136@columbia.edu     | Lol@321      |
      | Sounak_Ray                | sr3846@columbia.edu      | Password@321 |

    And I am on the ColumbiaChat home page
    And I am logged in as "Umang_Raj"
    Then I should have options to send messages to "Sounak_Ray", "Chinmay_Garg" and "Harrison_Groll"

  Scenario Outline: send a private chat to a single person
    When I send a message "<arg1>" to "<arg2>"
    Then I should see the message "<arg1>" on the chat with "<arg2>"
    And I should not see the message "<arg1>" on the chat with "<arg21>"
    And I should not see the message "<arg1>" on the chat with "<arg22>"
    Examples:
      | arg1                     | arg2             | arg21        | arg22          |
      | Happy Birthday Sounak!   | Sounak_Ray       | Chinmay_Garg | Harrison_Groll |
      | Happy Birthday Chinmay!  | Chinmay_Garg     | Sounak_Ray   | Harrison_Groll |
      | Happy Birthday Harrison! | Harrison_Groll   | Chinmay_Garg | Sounak_Ray     |