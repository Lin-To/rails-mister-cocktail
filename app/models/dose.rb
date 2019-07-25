class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail }

end

# a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
