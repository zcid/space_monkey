class Product < ActiveRecord::Base
  has_many :scores

  def get_score(product)
    x = 0
    product.scores.each do |score|
      x += score.user_score
    end 
    return x
  end

end
