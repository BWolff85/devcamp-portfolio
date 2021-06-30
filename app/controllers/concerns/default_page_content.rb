module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end
    
    def set_page_defaults
        @page_title = "Devcamp Portfolio | Brittany's Portfolio Website"
        @seo_keywords = "Brittany Wolff portfolio zombies pirates"
    end
end