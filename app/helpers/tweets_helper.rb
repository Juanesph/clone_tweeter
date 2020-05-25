module TweetsHelper
  def render_with_hashtags(content)
    content_words = content.split(" ")
    content_with_links = content_words.map do |word| 
      if word.include?("#")
        link_to word, tweets_path(search: word)
      else
        word
      end
    end

    content_with_links.join(" ")
  end
end
