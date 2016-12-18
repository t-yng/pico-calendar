class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery except: ["upload"]

  def upload
    day  = params[:day]
    file = params[:picture]
    name = file.original_filename
    File.open("public/pictures/#{name}", 'wb') {|f|
      f.write(file.read)
    }

    picture = Picture.new({day: day, picture: "/pictures/#{name}"})
    picture.save

    render nothing: true, status: 200
  end

  def calendar
    pictures = Picture.all
    render :json => pictures
  end

end
