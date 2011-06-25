class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :tag_cloud
  
  private
  def tag_cloud
    @tags = Article.tag_counts_on(:tags)
  end

end
