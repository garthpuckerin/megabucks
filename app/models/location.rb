class Location < ApplicationRecord
  has_many :profiles
  has_many :matches
end
