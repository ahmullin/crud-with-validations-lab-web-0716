class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year]}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Date.today.year}

  def released?
    released == true
  end

end
