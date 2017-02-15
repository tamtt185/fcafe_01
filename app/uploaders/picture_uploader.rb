# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
 
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def default_url *args
    if model.class.name == User.name
      ActionController::Base.helpers.asset_path("fallback/" + 
        [version_name, "avata_default.png"].compact.join('_'))
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
