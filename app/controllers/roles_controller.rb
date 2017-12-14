class RolesController < ApplicationController

  before_action :set_role, only: [:show, :destroy, :update]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new( role_params )


    if @role.save
      redirect_to @role
    else
      render :new
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role.update( role_params )

    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    redirect_to :roles
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end

end
