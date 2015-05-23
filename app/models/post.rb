class Post < ActiveRecord::Base
  after_save :some_complex_logic

  private

  def some_complex_logic
    # complex logic around published_at
    # - publish rss, tweet, etc...
  end
end
