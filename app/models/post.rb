class Post < ApplicationRecord

    after_initialize :set_defaults
    before_save :capitalize_title

    has_many :comments, dependent: :destroy

    belongs_to :user, optional: true

    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :body , length: {minimum: 50, maximum: 200} , presence: {message: 'must be provided'}
    validates :title, uniqueness: {scope: :body }
    validates :view_count, numericality: {greater_than_or_equal_to: 0}

    scope :recent_ten,lambda{order("created_at DESC").limit(10)}

    scope(:search, -> (query){ where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") })


    private
    def capitalize_title
        self.title.capitalize!
    end
    def set_defaults
        self.view_count ||= 0
    end
end