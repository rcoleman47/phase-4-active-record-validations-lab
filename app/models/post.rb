class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  
  validate :title_must_contain 

  private

  def title_must_contain
    words = [/Won't Believe|Secret|Top \d|Guess/]
    unless (words).any?{|w| w.match?(title)}
      errors.add(:title, "must contain clickbait")
    end
  end
  
end