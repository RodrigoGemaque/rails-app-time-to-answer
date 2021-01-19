class Site::SearchController < SiteController
  def questions
    # @questions = Question.includes(:answers).page params[:page]
    @questions = Question.search(params[:term], params[:page])
  end
   def subject
    @questions = Question._search_subject_(params[:subject_id], params[:page])
  end
end
