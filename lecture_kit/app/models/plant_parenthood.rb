class PlantParenthood < ActiveRecord::Base

    belongs_to :person
    belongs_to :plant

    def cap_affection
        self.affection = 11 if self.affection > 11
    end
end