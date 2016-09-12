class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  has_many :employees

  def slug_candidates
    [
      :business_name,
      [:business_name, :city]
    ]
  end
end
