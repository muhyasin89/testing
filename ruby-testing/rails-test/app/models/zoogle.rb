class Zoogle < ActiveRecord::Base
    belongs_to :zombie

    def langitude
        return 2
    end

    def longitude
        return 3
    end
end
