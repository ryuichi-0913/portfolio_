class SearchController < ApplicationController
  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @datas = search_for(@model, @content)
  end

  # 部分検索
  def search_part(model, content)
    if model == 'user' # rubocop:disable Style/CaseLikeIf
      User.where('name LIKE ?', "%#{content}%")
    elsif model == 'food'
      Food.where('food_name LIKE ?', "%#{content}%")
    elsif model == 'nonfood'
      Nonfood.where('nonfood_name LIKE ?', "%#{content}%")
    end
  end

  def search_for(model, content)
    search_part(model, content)
  end
end
