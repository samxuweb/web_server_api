class UsersController < ApplicationController

  before_action :require_login, :only => [:login, :get_info, :get_setting]

  def create
    if create_params.has_key?(:username) && create_params.has_key?(:userpwd)
      @user = User.new(:username => create_params[:username], :userpwd => create_params[:userpwd])
      @user.info = Info.new
      @user.info.user_sex = create_params[:user_sex] if create_params.has_key?(:user_sex)
      if !request.get? && create_params.has_key?(:head_portrait)
        @user.info.head_portrait = upload_image(create_params[:username], create_params[:head_portrait])
      end
      @user.setting = Setting.new
      if @user.save
        @status = 0
      elsif @user.errors.messages.has_key?(:username) && @user.errors.messages[:username] == ["uniqueness"]
        @status =21
      else
        @status = 30
      end 
    else
      @status = 11 if !create_params.has_key?(:userpwd)
      @status = 10 if !create_params.has_key?(:username)
    end
    render :json => {:status => @status}
  end

  def login
    render :json => {:status => @status}
  end

  def update_info
    if update_info_params.has_key?(:username) && update_info_params.has_key?(:userpwd)
      @user = User.find_by_username(update_info_params[:username])
      if @user.userpwd == update_info_params[:userpwd]
        info_params = update_info_params
        info_params.delete(:username)
        info_params.delete(:userpwd)
        if @user.info && @user.info.update(info_params)
          @status = 0
        else
          @status = 22
        end
      else
        @status = 21
      end
    else
      @status = 11 if !update_info_params.has_key?(:userpwd)
      @status = 10 if !update_info_params.has_key?(:username)
    end
    render :json => {:status => @status}
  end

  def get_info
    if @status == 0
      @info = @user.info
    else
      render :json => {:status => @status}
    end
  end

  def update_setting
    if update_setting_params.has_key?(:username) && update_setting_params.has_key?(:userpwd)
      @user = User.find_by_username(update_setting_params[:username])
      if @user.userpwd == update_setting_params[:userpwd]
        setting_params = update_setting_params
        setting_params.delete(:username)
        setting_params.delete(:userpwd)
        if @user.setting && @user.setting.update(setting_params)
          @status = 0
        else
          @status =30
        end
      else
        @status = 21
      end
    else
      @status = 11 if !update_setting_params.has_key?(:userpwd)
      @status = 10 if !update_setting_params.has_key?(:username)
    end
    render :json => {:status => @status}
  end

  def get_setting
    if @status == 0
      @setting = @user.setting
    else
      render :json => {:status => @status}
    end
  end

  def lost_password
    if lost_password_params
      @user = User.find_by_username(lost_password_params[:username])
      if @user
        @user.security_code = SecurityCode.new(:code => get_random(6))
        Mailer.send_mail(@user).deliver_now
        @status = 0
      else
        @status = 30
      end
    else
      @status = 10 if !lost_password_params
    end
    render :json => {:status => @status}
  end

  def set_password
    if set_password_params.has_key?(:username) && set_password_params.has_key?(:security_code) && set_password_params.has_key?(:new_userpwd)
      @user = User.find_by_username(set_password_params[:username])
      if @user && @user.security_code && ((Time.now) - @user.security_code.created_at < 1800)
        if @user.security_code.code == set_password_params[:security_code]
          @user.userpwd = set_password_params[:new_userpwd]
          @user.security_code.destroy
          if @user.save
            @status = 0
          else
            @status = 30
          end
        else
          @status = 20
        end
      else
        @status = 21
      end
    else
      @status = 1
      @status = 12 if !set_password_params.has_key?(:new_userpwd)
      @status = 11 if !set_password_params.has_key?(:security_code)
      @status = 10 if !set_password_params.has_key?(:username)
    end
    render :json => {:status => @status}
  end

  def upload_head_portrait
    if upload_params.has_key?(:username) && upload_params.has_key?(:userpwd) && upload_params.has_key?(:head_portrait)
      @user = User.find_by_username(upload_params[:username])
      if request.get?
        @status = 30
      elsif @user && @user.userpwd == upload_params[:userpwd]
        @user.info.head_portrait = upload_image(@user.username, upload_params[:head_portrait])
        if @user.info.save
          @status = 0
        else
          @status = 30
        end
      else
        @status = 20
      end 
    else
      @status = 12 if !upload_params.has_key?(:head_portrait)
      @status = 11 if !upload_params.has_key?(:userpwd)
      @status = 10 if !upload_params.has_key?(:username)
    end
    render :json => {:status => @status}
  end

  def get_head_portrait
    if login_params.has_key?(:username) && login_params.has_key?(:userpwd)
      @user = User.find_by_username(login_params[:username])
      if @user && @user.userpwd == login_params[:userpwd] && @user.info.head_portrait
        file_path = @user.get_image_path
        file_path = User.default_path unless File.file?(file_path)
        if File.exist?(file_path)
          io = File.open(file_path)
          io.binmode
          send_data(io.read, :filename => @user.info.head_portrait, :dispostion => 'attachment')
          io.close
        else
          render :json => {:status => 30}
        end
      else
        render :json => {:status => 21}
      end
    else
      @status = 11 if !login_params.has_key?(:userpwd)
      @status = 10 if !login_params.has_key?(:username)
      render :json => {:status => @status}
    end
  end

  private

  def require_login
    if login_params.has_key?(:username) && login_params.has_key?(:userpwd)
      @user = User.find_by_username(login_params[:username])
      if @user && @user.userpwd == login_params[:userpwd]
        @status = 0
      else
        @status = 21
      end
    else
      @status = 11 if !login_params.has_key?(:userpwd)
      @status = 10 if !login_params.has_key?(:username)
    end
  end

  def upload_image(name, files)
    File.open(Rails.root.join('public', 'image', name.to_s + files.original_filename.to_s), 'wb') do |file|
      file.write(files.read)
    end
    name.to_s + files.original_filename.to_s
  end

  def create_params
    params.permit(:username, :userpwd, :head_portrait, :user_sex)
  end

  def login_params
    params.permit(:username, :userpwd)
  end

  def update_info_params
    params.permit(:username, :userpwd, :user_sex, :image_size, :nickname, :age, :height, :weight, :pace, :phone_number1, :phone_number2)
    # params.permit(:username, :userpwd, :age)
  end

  def update_setting_params
    params.permit(:username, :userpwd, :calorie, :sprot_time, :step, :distance)
  end

  def lost_password_params
    params.permit(:username)
  end

  def set_password_params
    params.permit(:username, :security_code, :new_userpwd)
  end

  def upload_params
    params.permit(:username, :userpwd, :head_portrait)
  end
end
