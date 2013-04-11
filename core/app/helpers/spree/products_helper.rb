module Spree
  module ProductsHelper
    # returns the formatted change in price (from the master price) for the specified variant (or simply return
    # the variant price if no master price was supplied)
    def variant_price_diff(variant)
      diff = variant.price - variant.product.price
      return nil if diff == 0
      if diff > 0
        "(#{t(:add)}: #{Spree::Money.new(diff.abs).to_html})"
      else
        "(#{t(:subtract)}: #{Spree::Money.new(diff.abs).to_html})"
      end
    end

    # converts line breaks in product description into <p> tags (for html display purposes)
    def product_description(product)
      
        raw(product.description)
      
    end

    def line_item_description(variant)
      description = variant.product.description
      if description.present?
        truncate(strip_tags(description.gsub('&nbsp;', ' ')), :length => 100)
      else
        t(:product_has_no_description)
      end
    end

    def get_taxonomies
      @taxonomies ||= Spree::Taxonomy.includes(:root => :children)
    end
  end
end
