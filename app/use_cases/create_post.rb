class CreatePost
  def initialize(context, klass = Post)
    @context = context
    @klass = klass
  end

  attr_reader :context, :klass

  def perform(post_params)
    post = Post.new(post_params)

    if post.save && post.published_at.present?
      publish_post
      context.create_success(post)
    else
      context.create_failure(post)
    end
  end

  private

  def publish_post
    # complex logic here...
  end
end
