require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.test? #testの時にいちいちS3にあげていたら時間がかかるので、strageはfileにする。if文でテストの時と、その他の時で分けて上げる！
  CarrierWave.configure do |config|
    config.strage = :file
  end

else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                ENV['AWS_Region'],
    }
    config.fog_directory  = 'chat-space-tomoya'
    config.fog_public     = false
  end
end

#この記述で、S3にイメージを格納できた！！！！！！！！
# .envファイルに環境変数とその値を書いて、こっちに環境変数だけ書くことでAWSのアクセスキーなど、知られたはまずいものを
#書ける！


