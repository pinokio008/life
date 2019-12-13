class PostsController < ApplicationController
  def api
    hash = Post.useRFQ("https://goodreads-best-quotes.p.rapidapi.com/random","goodreads-best-quotes.p.rapidapi.com","dcad5607dbmshe831b61a9a07b62p1ce3b0jsne83a312de0ac")
    hash2 = hash["data"]
    @word = hash2["content"]
    @post = Post.find(params[:id])
  end

  def hesitation
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(content_params)
      redirect_to post_path(@post)
    else
      @word = @post.content_api
      render :api
    end
  end

  def create
    @post = Post.new(content_params)

    if @post.save
      redirect_to api_path(@post)
    else
      render :hesitation
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private
  def content_params
    params.require(:post).permit(:user_id, :pageid, :content, :content_api, :content_second)
  end
end
