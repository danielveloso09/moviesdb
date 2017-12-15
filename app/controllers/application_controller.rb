class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :validate_user, except: [:index, :show]

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # FIXME
  def validate_user
    if !current_user.blank? &&
       !current_user.admin? &&
       %w[movies actors roles].include?(params[:controller])
      redirect_to "/#{params[:controller]}"
    end
  end
end
