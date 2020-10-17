class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @datas = search_for(@model, @content)
  end

  def partical(model, content)
    if model == 'user'
      User.where("name LIKE ?", "%#{content}%")
    elsif model == 'food'
      Food.where("food_name LIKE ?", "%#{content}%")
    elsif model == 'nonfood'
      Nonfood.where("nonfood_name LIKE ?", "%#{content}%")
    end
  end

  def search_for(model, content)

      partical(model, content)

  end
end