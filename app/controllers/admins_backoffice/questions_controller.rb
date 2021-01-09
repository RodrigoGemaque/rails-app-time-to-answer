class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit,:update, :destroy]
  def index
    @questions = Question.all.page params[:page]
  end  

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      redirect_to admins_backoffice_questions_path  notice: " Questao Criada com sucesso"
     
    else
      render :new
      flash[:error] = "Something went wrong"

    end
  end  
  def edit;end

  def update
    @question = Question.find(params[:id])
    if @question.update params_question
      redirect_to admins_backoffice_questions_path, notice: "Questao atualizada com sucesso"
    else
      render :edit
    end
    
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to admins_backoffice_questions_path
    else
      flash[:error] = 'Something went wrong'
      render :index
    end
  end
  

  private
  def params_question
    params.require(:question).permit(:description)
  end
  
  

  def set_question
    @question = Question.find(params[:id])
  end

end
