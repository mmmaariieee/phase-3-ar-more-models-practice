class Person < ActiveRecord::Base
    has_many :plant_parenthoods
    has_many :plants, through: :plant_parenthoods
    has_many :waterings
    has_many :waterees, through: :waterings

    def water_plant(plant)
        Watering.create(wateree: plant, waterer: self)
        if self.plants.include?(plant)
            pp = self.plant_parenthoods.where(plant_id: plant.id)[0]
            pp.update(affection: pp.affection +=1)
        end
    end
end