# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  version :special do
    process resize_to_fill: [400, 250]
  end

  version :content do
    process resize_to_limit: [800, 800]
  end

end
