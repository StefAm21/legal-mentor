module ApplicationHelper
  def star_rating(rating)
    output = ''

    # Add full stars
    rating.floor.times do
      output += '<i class="fas fa-star"></i>'
    end

    # Add half star if needed
    if rating - rating.floor >= 0.5
      output += '<i class="fas fa-star-half-alt"></i>'
    end

    # Add empty stars
    (5 - rating.ceil).times do
      output += '<i class="far fa-star"></i>'
    end

    # Add rating as text
    output += "<span>#{rating}</span>"

    output.html_safe
  end
end
