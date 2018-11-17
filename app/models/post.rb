class Post < ActiveRecord::Base
  validates :title, presence: true
  validates_with click_bait?
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def click_bait?(record)
    t = record.title
    !!t.index("Won't Believe") || !!t.index("Secret") || !!t.index(/Top\s\d/) || !!t.index("Guess")
  end
end
