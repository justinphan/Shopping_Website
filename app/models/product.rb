class Product < ApplicationRecord
    has_many :order_items

    default_scope { where(active: true) }
    validates :name,  presence: true
    validates :name,  presence: true, length: { maximum: 30 }

  end
