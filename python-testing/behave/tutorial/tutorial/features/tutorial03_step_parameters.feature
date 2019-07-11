# Created by muhyasin89 at 9/15/17
Feature: Step Parameters (tutorial03)

  Scenario: Blenders
    Given I put "apples" in a blender
    When  I switch the blender on
    Then  it should transform into "apple juice"