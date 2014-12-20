module ProductsHelper
  def get_score(product)
    x = 0
    product.scores.each do |score|
      x += score.user_score || 0
    end 
    return x
  end

end
