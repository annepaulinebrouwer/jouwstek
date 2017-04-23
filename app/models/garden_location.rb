class GardenLocation < ApplicationRecord
  belongs_to :garden
  belongs_to :garden_ownership
end
