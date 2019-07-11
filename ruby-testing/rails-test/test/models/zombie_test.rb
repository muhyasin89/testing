require 'test_helper'
require "mocha/test_unit"

class ZombieTest < ActiveSupport::TestCase

    def setup
        @z = zombies(:ash)
    end

    # def test_invalid_without_a_name
    test "invalid without a name" do
        z= Zombie.new
        assert !z.valid?, "Name is not being validated"
    end
    #should validate_presence_of(:name)

    test "valid with every attribute" do
        # z =Zombie.new
        # z.name = 'Ash'
        # z.graveyard = 'Oak Park'
        ##### normal code dry ####
        #z = zombies(:ash)
        #assert z.valid?, "Zombie is not valid"
        ##### end normal code dry ####
        assert @z.valid?,"Zombie is not valid"
    end



    test "invalid name gives error message" do
        ##### normal code dry ####
        #z =zombies(:ash)
        #z.name = nil
        #z.valid?
        #assert_match /can't be blank/, z.errors[:name].join, "Presence error not found on zombie"
        ##### end normal code dry ####

        @z.name = nil
        assert_presence(@z, :name)
    end


    test "invalid graveyard gives error message" do
        ##### normal code dry ####
        #z =zombies(:ash)
        #z.graveyard = nil
        #z.valid?
        #assert_match /can't be blank/, z.errors[:graveyard].join, "Presence error not found on zombie"
        ##### end normal code dry ####

        @z.graveyard = nil
        assert_presence(@z, :graveyard)
    end



    test "should responds to tweet" do
        ##### normal code dry ####
        #z = zombies(:ash)
        #assert_respond_to z, :tweets
        ##### end normal code dry ####

        assert_respond_to @z, :tweets
    end

    test "should contain tweets" do
        ##### normal code dry ####
        #z = zombies(:ash)
        #assert_equal z.tweets, [tweets(:ash_2),tweets(:ash_1)]
        ##### end normal code dry ####

        assert_equal @z.tweets, [tweets(:ash_2),tweets(:ash_1)]
    end


    test "can generate avatar url" do
        ##### normal code dry ####
        #z = zombies(:ash)
        #assert_equal "http://zombitar.com/#{z.id}.jpg", z.avatar_url
        ##### end normal code dry ####

        assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
    end

    test "should contain only tweets that belongs to zombie" do
        ##### normal code dry ####
        #z = zombies(:ash)
        #assert z.tweets.all? {|t| t.zombie ==  z }
        ##### end normal code dry ####

        assert @z.tweets.all? {|t| t.zombie ==  @z }
    end

    test "decapitate should set status to dead again" do
        # this is will add after install mocha
        #@zombie.weapon.stubs(:slice) # error doesnt work
        @zombie.weapon.expects(:slice)
        #end
        @zombie.decapitate
        assert_equal "dead again", @zombie.status
    end

    test "geolocate calls the Zoogle graveyard locator" do
        #Zoogle.expects(:graveyard_locator)
        Zoogle.expects(:graveyard_locator).with(@zombie.graveyard).returns({langitude: 2, lognitude: 5})
        @zombie.geolocate
    end

    test "geolocate_with_object properly formatted lat,long" do
        loc = stubs(langitude: 2,longitude: 3)
        Zoogle.stubs(:graveyard_locator).returns(loc)
        assert_equal "2, 3", @zombie.geolocate_with_object
    end
end
