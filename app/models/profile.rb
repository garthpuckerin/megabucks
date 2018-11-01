class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :location

  def full_name
    "#{first_name} #{last_name}"
  end

  default_scope { order(:id) }

  
end
