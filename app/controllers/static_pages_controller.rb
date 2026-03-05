class StaticPagesController < ApplicationController
  def home
      @gallery = GalleryPhotos.new(params[:id]).get_photos || nil
  end
end
