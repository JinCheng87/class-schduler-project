class StudiosController <ApplicationController
  before_action :authenticate_user!
  before_action :find_studio
  def new
    studio = current_user.studios.new
    render :new, locals: { studio: studio }
  end

  def index
    studios = current_user.studios.all
    render :index, locals: { studios: studios }
  end

  def create
    studio = current_user.studios.new(studio_params)
    if studio.save
      redirect_to studio
    else
      render :new, locals: { studio: studio }
    end
  end

  def show
    owner_name = User.find_by(id: @studio.user_id).name
    render :show, locals: { studio: @studio, owner_name: owner_name }
  end

  def edit
    render :edit, locals: { studio: @studio }
  end

  def update
    if @studio.update_attributes(studio_params)
      redirect_to @studio
    else
      render :edit, locals: { studio: @studio}
    end
  end

  def destroy
    @studio.destroy
    redirect_to studios_path
  end

  private

  def find_studio
    @studio = Studio.find_by(id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render :'error/not_found', status: :not_found
  end

  def studio_params
    params.require(:studio).permit(:name, :address, :description)
  end
end