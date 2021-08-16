class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, presence: true
    validates :state, length: { is: 2 }
    validates :branch, :street, :city, length: { maximum: 40 }
    validates :branch, uniqueness: true
    has_many :students, dependent: :destroy
end
