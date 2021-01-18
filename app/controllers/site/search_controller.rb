class Site::SearchController < SiteController
  def questions
    # @questions = Question.includes(:answers).page params[:page]
    @questions = Question.search(params[:term], params[:page])
  end
end
