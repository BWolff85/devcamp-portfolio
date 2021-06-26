module Placeholder
    extend ActiveSupport::Concern

    def self.image_generator(height:, width:)
        "https://picsum.photos/#{height}/#{width}"
    end
end