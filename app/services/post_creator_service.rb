class PostCreatorService
  def initialize(klass = Post)
    @post = klass.new
  end

  attr_reader :post

  def create(params)
    post.attributes = params
    if post.save && post.published_at.present?
      publish_post
    end
  end

  def valid_post?
    post.valid?
  end

  private

  def publish_post
    # complex logic here...
  end
end
