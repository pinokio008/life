class PostsController < ApplicationController
  def api
    response = Post.useRFQ("https://andruxnet-random-famous-quotes.p.rapidapi.com/?cat=famous&count=10",'andruxnet-random-famous-quotes.p.rapidapi.com','dcad5607dbmshe831b61a9a07b62p1ce3b0jsne83a312de0ac')
    @word = response.read_body
    @user = User.find(params [:post] [:user_id])
  end
  def hesitation
  end
end
