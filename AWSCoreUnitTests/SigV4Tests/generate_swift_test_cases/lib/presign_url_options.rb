class PresignUrlOptions
  require 'time'

  @@DEFAULT_REGION = "us-east-1"
  @@DEFAULT_SERVICE = "service"

  # From SigV4 test suite
  # (1440938160 epoch seconds)
  @@DEFAULT_TIME = Time.parse("20150830T123600Z")

  # Default expiry to 1 day
  @@DEFAULT_EXPIRY = 86_400

  class << self
    attr_accessor :DEFAULT_REGION
    attr_accessor :DEFAULT_SERVICE
    attr_accessor :DEFAULT_TIME
    attr_accessor :DEFAULT_EXPIRY
  end

  attr_accessor :url
  attr_accessor :http_method
  attr_accessor :headers
  attr_accessor :body
  attr_accessor :service
  attr_accessor :region
  attr_accessor :expiry
  attr_accessor :time

  def initialize(url:,
    http_method:,
    headers:,
    body:,
    region: @@DEFAULT_REGION,
    service: @@DEFAULT_SERVICE,
    expiry: @@DEFAULT_EXPIRY,
    time: @@DEFAULT_TIME)

    self.url = url
    self.http_method = http_method
    self.headers = headers
    self.body = body
    self.service = service
    self.region = region
    self.expiry = expiry
    self.time = time
  end

  def as_options_hash_for_test_case(test_case)
    options = {:url => url,
      :http_method => http_method,
      :headers => headers,
      :service => @@DEFAULT_SERVICE,
      :region => @@DEFAULT_REGION,
      :expires_in => @@DEFAULT_EXPIRY,
      :time => !time.nil? ? time : @@DEFAULT_TIME}

    if test_case.sign_body
      options[:body] = body
    else
      options[:body_digest] = "UNSIGNED-PAYLOAD"
    end

    options[:sign_security_token] = test_case.sign_security_token

    options
  end

  def self.parse_x_amz_date(x_amz_date)
    Time.parse(x_amz_date)
  end

end