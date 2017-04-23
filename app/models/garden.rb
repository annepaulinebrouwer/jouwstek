class Garden < ApplicationRecord
  has_one :garden_location
  has_attachments :photos, maximum: 5
end
