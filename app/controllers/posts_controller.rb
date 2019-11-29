class PostsController < ApplicationController
  def api
    response = Post.useRFQ("https://andruxnet-random-famous-quotes.p.rapidapi.com/?cat=famous&count=10",'andruxnet-random-famous-quotes.p.rapidapi.com','dcad5607dbmshe831b61a9a07b62p1ce3b0jsne83a312de0ac')
    @word = response.read_body
  end

  def hesitation
    @post = Post.new
  end

  def create
    @post = Post.new(content_params)

    if @post.save
      redirect_to posts_api_path
    else
      render :hesitation
    end
  end

  def content_params
    params.require(:post).permit(:user_id, :pageid, :content)
  end
end
