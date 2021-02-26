class BasicCredentialsProvider

  require "aws-sdk-core/credentials"

  def initialize(access_key_id:, secret_access_key:)
    @credentials = Aws::Credentials.new(access_key_id, secret_access_key)
  end

  def credentials
    return @credentials
  end
end

class BasicAssumeRoleCredentialsProvider

  require "aws-sdk-core/credentials"

  def initialize(access_key_id:, secret_access_key:, session_token:)
    @credentials = Aws::Credentials.new(access_key_id, secret_access_key, session_token)
  end

  def credentials
    return @credentials
  end
end