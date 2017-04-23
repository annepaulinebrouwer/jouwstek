class GardenLocation < ApplicationRecord
  belongs_to :garden

  geocoded_by :address
  after_validation :geocode

  def address
    [city, street_name, postal_code, house_number, country].compact.join(', ')
  end
end