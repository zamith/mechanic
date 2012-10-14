@disable-bundler
Feature: Creating a Github repo

  Scenario: --github=organization/project
    When I take a project called "test_project" to the mechanic with:
      | argument | value                |
      | --github | organization/project |
    Then the "organization/project" Github repo should exist
