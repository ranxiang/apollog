class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    params[:comment][:author_ip] = request.remote_ip
    @comment = @article.comments.create(params[:comment])

    respond_to do |format|
      if verify_recaptcha(:model => @comment, :message => "Oh! It's error with reCAPTCHA!") && @comment.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @comment, status: :created, location: @article }
      else
        format.html { render 'articles/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
