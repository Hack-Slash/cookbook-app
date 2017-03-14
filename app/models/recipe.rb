class Recipe < ApplicationRecord
  def directions_list
    return directions.split(", ")
  end

  def ingredients_list
    return ingredients.split(", ")
  end

  def friendly_created_at
    return created_at.strftime("%A, %b %d")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    result += "#{hours} hours " if hours > 0
    result += "#{minutes} minutes" if minutes > 0
    result
  end
end
