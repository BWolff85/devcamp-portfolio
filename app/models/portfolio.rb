class Portfolio < ApplicationRecord
    validates_presence_of :title, :main_image, :thumb_image

    def self.ar
        where(subtitle: "Arrrrr, matey!")
    end

    scope :swab, -> { where(subtitle: "Swab them planks!") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "https://picsum.photos/600/400"
        self.thumb_image ||= "https://picsum.photos/350/200"
    end
end
