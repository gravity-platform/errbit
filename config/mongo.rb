Mongoid.configure do |config|
  uri = if Errbit::Config.mongo_url == 'mongodb://localhost'
          JSON.parse( ENV['VCAP_SERVICES'] )['mongodb-2.2'].first['credentials']['url'] rescue "mongodb://localhost/errbit_#{Rails.env}"
        else
          Errbit::Config.mongo_url
        end

  config.load_configuration({
    sessions: {
      default: {
        uri: uri
      }
    },
    options: {
      use_activesupport_time_zone: true
    }
  })
end
