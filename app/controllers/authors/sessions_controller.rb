class Authors::SessionsController < Devise::SessionsController
  def create
    login_param = params[:author][:login]
    author = Author.find_by_name(login_param) || Author.find_by_email(login_param)
    if author && author.locked_at
      flash[:alert] = t('devise.failure.locked')
      return redirect_to new_author_session_url
    end

    failed_login_email_session = session[:failed_login_email] || ""
    login_attempts_session = session[:login_attempts] || 0


    if failed_login_email_session != "" && failed_login_email_session != login_param
      session[:failed_login_email] = ""
      session[:login_attempts] = 0
    end

    if session[:login_attempts].to_i >= 1
      if not verify_recaptcha
        flash[:alert] = t('.incorrect_captcha')
        flash.delete :recaptcha_error
        return redirect_to new_author_session_url
      end
    end

    self.resource = warden.authenticate!(auth_options)
    # Login successfully
    session[:failed_login_email] = ""
    session[:login_attempts] = 0

    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    redirect_to root_url

  end

  def failure
    # Login failed
    login_attempts_session = session[:login_attempts]
    param = params[:author][:login]
    session[:failed_login_email] = param
    session[:login_attempts] = login_attempts_session.to_i + 1

    if session[:login_attempts].to_i >= 3
      author = Author.find_by_name(param) || Author.find_by_email(param)
      if author
        author.locked_at = Time.now.utc
        author.save
      end
    end

    build_resource(sign_in_params)
    clean_up_passwords(resource)
    render :new
  end

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#failure" }
  end

  # GET /resource/sign_in
  # def new
  #  super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
