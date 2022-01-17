class Post < ApplicationRecord
    validates_presence_of :title
    has_rich_text :content
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :has_categories  
    has_many :categories, through: :has_categories
    attr_accessor :category_elements

    def save_categories
        return has_categories.where(post: self).destroy_all if category_elements.nil? || category_elements.empty? 

        has_categories.where.not(post: self, category_id: category_elements).destroy_all
        category_elements.each do |category_id|
            HasCategory.find_or_create_by(post: self, category_id: category_id)
        end
    end
end