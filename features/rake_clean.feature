@disable-bundler
Feature: Rake works in the project taken to the mechanic

  Scenario: Running rake in the project taken to the mechanic
    When I take a project called "test_project" to the mechanic
    And I cd to the "test_project" root
    When I drop and create the required databases
    And I run the rake task "db:create"
    And I run the rake task "db:migrate"
    And I run the rake task "db:test:prepare"
    And I run rake
    Then I see a successful response in the shell

  Scenario: Making a spec then running rake
    When I drop and create the required databases
    And I take a project called "test_project" to the mechanic
    And I generate "model post title:string"
    And I run the rake task "db:migrate"
    And I run the rake task "db:test:prepare"
    And I run the rake task "spec"
    Then I see a successful response in the shell
