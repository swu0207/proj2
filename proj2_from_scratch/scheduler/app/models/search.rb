class Search < ActiveRecord::Base
  def courses
    @courses ||= find_courses
  end
  
  private

  def find_courses
    search = Course.search
    search.name_like(keywords) unless keywords.blank?
    search.units_gte(minimum_units) unless minimum_units.blank?
    search.units_lte(maximum_units) unless maximum_units.blank?
    search.category_id_equals(category_id) unless category_id.blank?
    search.all
  end
end
