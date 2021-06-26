class Portfolio < ApplicationRecord
    validates_presence_of :title, :main_image, :thumb_image

    def self.ar
        where(subtitle: "Arrrrr, matey!")
    end

    scope :swab, -> { where(subtitle: "Swab them planks!") }
end
