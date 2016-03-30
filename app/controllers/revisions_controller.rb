class RevisionsController < ApplicationController

  def index
    @revisions = Revision.all
  end

  def upload
      @revisions = Revision.all
      if upload_params[:file]
        @revision = Revision.new
        uploaded_io = upload_params[:file]
          File.open(Rails.root.join('public', 'files', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
        @revision.file_url = uploaded_io.original_filename
        @revision.file_name = upload_params[:file_name]
        @revision.version = upload_params[:version]
        if @revision.save
          redirect_to :revisions
        else
          flash[:notice] = "保存失败"
          render :controller => :revisions, :action => :index
        end
      else
        flash[:notice] = "上传文件为空"
        render :controller => :revisions, :action => :index
      end
  end

  def get_version
    @revision = Revision.last
    render :json => {:version => @revision.version}
  end

  def download
    if @revision = Revision.last
      file_path = @revision.get_file_path
      if File.exist?(file_path)
        io = File.open(file_path)
        io.binmode
        send_data(io.read, :filename => @revision.file_url, :dispostion => 'attachment')
        io.close
      else
        render :json => {:status => 30}
      end
    else
      render :json => {:status => 30}
    end
  end

  private

  def upload_params
    # params.permit(:username, :userpwd, :file, :filename)
    params.require(:revision).permit(:version, :file, :file_name)
  end

end
