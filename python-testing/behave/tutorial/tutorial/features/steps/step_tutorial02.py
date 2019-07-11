from behave   import given, when, then
from hamcrest import assert_that, equal_to, is_not
from objects.NinjaFight import NinjaFight

# @given(u'the ninja has a third level black-belt')
# def step_impl(context):
#     raise NotImplementedError(u'STEP: Given the ninja has a third level black-belt')
#
# @when(u'attacked by a samurai')
# def step_impl(context):
#     raise NotImplementedError(u'STEP: When attacked by a samurai')
#
# @then(u'the ninja should engage the opponent')
# def step_impl(context):
#     raise NotImplementedError(u'STEP: Then the ninja should engage the opponent')
#
# @when(u'attacked by Chuck Norris')
# def step_impl(context):
#     raise NotImplementedError(u'STEP: When attacked by Chuck Norris')
#
# @then(u'the ninja should run for his life')
# def step_impl(context):
#     raise NotImplementedError(u'STEP: Then the ninja should run for his life')
"""
this in new step from step 9 
"""

@given('the ninja encounters another opponent')
def step_the_ninja_encounters_another_opponent(context):
    """
    BACKGROUND steps are called at begin of each scenario before other steps.
    """
    # -- SETUP/TEARDOWN:
    if hasattr(context, "ninja_fight"):
        # -- VERIFY: Double-call does not occur.
        assert_that(context.ninja_fight, is_not(equal_to(None)))
    context.ninja_fight = None

@given('the ninja has a {achievement_level}')
def step_the_ninja_has_a(context, achievement_level):
    context.ninja_fight = NinjaFight(achievement_level)

@when('attacked by a {opponent_role}')
def step_attacked_by_a(context, opponent_role):
    context.ninja_fight.opponent = opponent_role

@when('attacked by {opponent}')
def step_attacked_by(context, opponent):
    context.ninja_fight.opponent = opponent

@then('the ninja should {reaction}')
def step_the_ninja_should(context, reaction):
    assert_that(reaction, equal_to(context.ninja_fight.decision()))

