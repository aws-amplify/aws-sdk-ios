require_relative "lib/app_shell"

class PresignedURLTestSuite < AppShell
  require 'erb'

  require_relative "lib/signer_forked"
  require_relative "lib/sigv4_test_case"
  require_relative "lib/static_credentials_providers"

  @@BANNER = "Generate SigV4TestsCases.swift from cases in SigV4 test suite"

  def initialize(args: nil, options: nil)
    super(args: args, options: options)
    initialize_credential_providers
  end

  # Using credentials from SigV4 test suite at
  # https://docs.aws.amazon.com/general/latest/gr/signature-v4-test-suite.html
  def initialize_credential_providers
    @basic_credential_provider = BasicCredentialsProvider.new(
      access_key_id: "AKIDEXAMPLE",
      secret_access_key: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY"
    )

    @assume_role_credentials_provider = BasicAssumeRoleCredentialsProvider.new(
      access_key_id: "AKIDEXAMPLE",
      secret_access_key: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY",
      session_token: "AQoDYXdzEPT//////////wEXAMPLEtc764bNrC9SAPBSM22wDOk4x4HIZ8j4FZTwdQWLWsKWHGBuFqwAeMicRXmxfpSPfIeoIYRqTflfKD8YUuwthAx7mSEI/qkPpKPi/kMcGdQrmGdeehM4IC1NtBmUpp2wUE8phUZampKsburEDy0KPkyQDYwT7WZ0wq5VSXDvp75YU9HFvlRd8Tx6q6fE8YQcHNVXAkiY9q6d+xo0rKwT38xVqr7ZD0u0iPPkUL64lIZbqBAz+scqKmlzm8FDrypNC9Yjc8fPOLn9FX9KSYvKTr4rvx3iSIlTJabIQwj2ICCR/oLxBA=="
    )
  end

  def add_additional_options(opt_parser)
    opt_parser.on("-oFILE", "--output-file=FILE", "Output file for Swift test cases") do |file|
      @options[:output_file] = file
    end

    opt_parser.on("-rDIR", "--root-directory=DIR", "Root directory of test suite definitions") do |dir|
      @options[:root_directory] = dir
    end

    opt_parser.separator ""
  end

  def load_tests(root_directory)
    @logger.debug "Scanning #{root_directory}"

    results = []
    children = Dir.children(root_directory)
    subdirectories = children
      .map { |child| File.join(root_directory, child) }
      .select { |child| File.directory?(child) }

    if subdirectories.empty?
      test_case = load_test_case(root_directory)
      results << test_case
    else
      subdirectories.each do |subdir|
        test_cases = load_tests(subdir)
        results += test_cases
      end
    end

    results
  end

  def load_test_case(dir)
    @logger.debug "Loading test case from #{dir}"
    test_case = SigV4TestCase.new()
    test_case_name = File.basename(dir)
    test_case.name = test_case_name
    test_case.request = File.read(File.join(dir, "#{test_case_name}.req"))
    test_case.sign_body = should_sign_body(test_case)
    test_case.sign_security_token = should_sign_security_token(test_case)
    test_case.credentials_provider = credentials_provider(test_case)
    test_case
  end

  def process_test_cases(test_cases)
    test_cases.each do |test_case|
      presign_options = test_case.get_presign_url_options

      signer = Aws::Sigv4::Signer.new(
        service: presign_options.service,
        region: presign_options.region,
        credentials_provider: test_case.credentials_provider
      )

      begin
        options_hash = presign_options.as_options_hash_for_test_case test_case
        result = signer.presign_url options_hash
        test_case.result = result
      rescue => exception
        @logger.error "Error in #{test_case.name}: #{exception}"
      end
    end
  end

  def get_swift_test_cases(test_cases)
    current_path = File.dirname(__FILE__)
    template_path = File.join(current_path, "lib", "swift_test_cases.erb")

    @logger.debug "Reading Swift template file from #{template_path}"

    template = File.read(template_path)
    swift_erb = ERB.new(template)
    result = swift_erb.result_with_hash({:test_cases => test_cases})
  end

  def write_swift_file(swift_test_cases)
    output_file = @options[:output_file]
    @logger.debug "Writing Swift test cases to #{output_file}"
    File.write(output_file, swift_test_cases)
    @logger.info "Wrote #{swift_test_cases.length} bytes to #{output_file}"
  end

  # Currently there are no test cases that require signing the body
  def should_sign_body(test_case)
    false
  end

  # Return true for test cases that should include the session_token/
  # security token in the canonical query string
  def should_sign_security_token(test_case)
    case test_case.name
    when "post-sts-header-before"
      true
    else
      false
    end
  end

  # Return the assume_role_credentials_provider for test cases that that
  # verify behavior of credentials with session tokens
  def credentials_provider(test_case)
    case test_case.name
    when "post-sts-header-after"
      @assume_role_credentials_provider
    when "post-sts-header-before"
      @assume_role_credentials_provider
    else
      @basic_credential_provider
    end
  end

  def run
    test_cases = load_tests(@options[:root_directory])
    @logger.info "Loaded #{test_cases.length} test cases"
    results = process_test_cases(test_cases)
    swift_test_cases = get_swift_test_cases(test_cases)
    write_swift_file(swift_test_cases)
  end

end

if __FILE__ == $0
  app = PresignedURLTestSuite.new(args: ARGV)
  app.run
end