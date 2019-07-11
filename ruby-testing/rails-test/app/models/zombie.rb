class Zombie < ActiveRecord::Base
    has_many :tweets, dependent: :destroy
    validates :name,  presence: true
    has_one :weapon

    def avatar_url
        "http://zombitar.com/#{id}.jpg"
    end

    def decapitate
        weapon.slice(self, :head)
        self.status = "dead again"
    end

    def slice(*args)
        return nil
    end

    def geolocation
        Zooge.graveyard_locator(self.graveyard)
    end

    def geolocate_with_object
        loc = Zoogle.graveyard_locator(self.graveyard),"#{loc.langitude}, #{loc.longitude}"
    end
end
