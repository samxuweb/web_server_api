class RevisionsController < ApplicationController

  def upload
    if upload_params.has_key?(:username) && upload_params.has_key?(:userpwd) && upload_params.has_key?(:file) && upload_params.has_key?(:filename)
      if request.get?
        @status = 30
      elsif upload_params[:username] == 'root' && upload_params[:userpwd] == 'pinsole'
        @revision = Revision.new
        uploaded_io = upload_params[:file]
          File.open(Rails.root.join('public', 'files', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
        @revision.file_url = uploaded_io.original_filename
        @revision.file_name = upload_params[:filename]
        if @revision.save
          @status = 0
        else
          @status = 30
        end
      else
        @status = 20
      end
    else
      @status = 13 if !upload_params.has_key?(:file)
      @status = 12 if !upload_params.has_key?(:filename)
      @status = 11 if !upload_params.has_key?(:userpwd)
      @status = 10 if !upload_params.has_key?(:username)
    end
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
    params.permit(:username, :userpwd, :file, :filename)
  end

end
