class SigV4TestResult
  attr_accessor :canonical_request
  attr_accessor :string_to_sign
  attr_accessor :signature
  attr_accessor :url

  def initialize(canonical_request:, string_to_sign:, signature:, url:)
    self.canonical_request = canonical_request
    self.string_to_sign = string_to_sign
    self.signature = signature
    self.url = url
  end

end