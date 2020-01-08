class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  if Rails.env.production? || Rails.env.staging?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :convert => 'jpg'
  
  version :thumb do
    process :resize_to_limit => [700, 700]
  end

  version :thumb50 do
    process :resize_to_limit => [50, 50]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "default.png"
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' 
  end

  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end
end
