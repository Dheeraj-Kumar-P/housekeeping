# user helper
module UsersHelper
  def begin_redirect(params)
    if params[:users][:password] != params[:password][:password]
      flash[:error] = 'Invalid password!!!'
      redirect_to action: 'new', id: params[:id]
    end
  end

  def create_redirect(params)
    Salary.create(user_id: @user.id)
    flash[:success] = 'User Created !'
    redirect_to controller: 'hotels', action: 'show', id: params[:id]
  end

  def flash_error(error, params)
    if params[:roles] && params[:shift]
      flash[:error] = error.message
    else
      flash[:error] = 'Role must be specified!!' if params[:roles].nil?
      flash[:error] = 'Shift must be specified!!' if params[:shift].nil?
    end
    redirect_to action: 'new', id: params[:id]
  end

  def user_create(params)
    @user = User.create(create_attrs(params))
    @image = Image.create(image_attr(params))
    @user.update_attributes!(image_id: @image.id)
  end

  def create_attrs(params)
    pass = Digest::MD5.hexdigest(params[:users][:password])
    { name: params[:users][:name],
      password: pass,
      email: params[:users][:email],
      phone_no: params[:users][:phone_no],
      is_active: 1,
      hotel_id: params[:id],
      role_id: params[:roles][:id],
      shift_id: params[:shift][:id] }
  end
end
