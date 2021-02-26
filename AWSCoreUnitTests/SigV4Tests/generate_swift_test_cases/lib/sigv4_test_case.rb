require_relative 'presign_url_options'

class SigV4TestCase

  attr_accessor :name
  attr_accessor :request
  attr_accessor :sign_body
  attr_accessor :credentials_provider
  attr_accessor :sign_security_token
  attr_accessor :result

  # @returns a PresignUrlOptions representing the original request
  def get_presign_url_options
    lines = request.split "\n"

    start_line = lines.shift
    start_line_components = start_line.split " "

    http_method = start_line_components.shift

    host = request[/host:(.*)$/i, 1].strip
    target = start_line_components.shift
    url = "https://#{host}#{target}"

    x_amz_date = request[/x-amz-date:(.*)$/i, 1]
    time = PresignUrlOptions.DEFAULT_TIME
    if !x_amz_date.nil?
      x_amz_date.strip!
      time = PresignUrlOptions.parse_x_amz_date x_amz_date
    end

    # Scan for payload
    header_lines = []
    while (lines.length > 0) do
      line = lines.shift
      break if line.empty?
      header_lines << line
    end

    current_header_name = ""
    headers = {}
    header_lines.each do |line|
      # Folded headers are deprecated, but we still need to be able to canonicalize them.
      if line =~ /^\s+/
        headers[current_header_name] += "\n" + line
        next
      end

      (name, value) = line.split ":"
      name.strip! if !name.nil?
      value.strip! if !value.nil?
      headers[name] = value
      current_header_name = name
    end

    body = nil
    if !lines.empty?
      body = lines.join "\n"
    end

    options = PresignUrlOptions.new(url: url, http_method: http_method, headers: headers, body: body, time: time)

    options
  end

end