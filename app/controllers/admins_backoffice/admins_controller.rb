class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :verify_password, only: [:update,:create]
  before_action :set_admin, only: [:edit,:update, :destroy]
  def index
    @admins = Admin.all.page params[:page]
  end  

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(set_params_admin)
    if @admin.save
      redirect_to admins_backoffice_admins_path
      flash[:success] = "Object successfully created"
    else
      render :new
      flash[:error] = "Something went wrong"

    end
  end  
  def edit;end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update set_params_admin
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso"
    else
      render :edit
    end
    
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to admins_backoffice_admins_path
    else
      flash[:error] = 'Something went wrong'
      render :index
    end
  end
  

  private
  def set_params_admin
    params.require(:admin).permit(:email,:password,:password_confirmation)
  end
  
  def verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password,:password_confirmation)
    end   
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
