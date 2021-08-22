module ReviewHelper
  
    def search_by_title(reviews, title)
        regex_version = Regexp.new title
        filtered_reviews = reviews.map { |review| review if regex_version.match(review.title) }.compact

        return filtered_reviews
    end

    def search_by_description(reviews, description)
        regex_version = Regexp.new description
        filtered_reviews = reviews.map { |review| review if regex_version.match(review.description) }.compact

        return filtered_reviews
    end

    def search_by_following_users(search_term)
        following_reviews = current_user.followings.reviews

        regex_version = Regexp.new reviewer_name
        filtered_reviews = {search_by_title(following_reviews, search_term) + search_by_description(following_reviews, search_term)}.uniq

        return filtered_reviews
    end
    
end