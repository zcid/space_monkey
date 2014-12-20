class Product < ActiveRecord::Base
  has_many :reviews
  has_many :scores

  def get_score
    x = 0
    self.scores.each do |score|
      x += score.user_score
    end 
    return x
  end
end
