class Advogado < ApplicationRecord
  belongs_to :user
  validates :nome, presence: true, length: { minimum: 3 }
  validates :n_OAB, presence: true, length: { is: 6 }
end
