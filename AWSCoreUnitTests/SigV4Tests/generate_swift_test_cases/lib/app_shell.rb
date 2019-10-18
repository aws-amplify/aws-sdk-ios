class AppShell
  require "logger"
  require "optparse"

  @@BANNER = "A shell with app boilerplate & option parsing, suitable for subclassing"
  @@VERSION = [0, 0, 1]

  LOG_LEVELS = [ Logger::WARN, Logger::INFO, Logger::DEBUG ]

  @logger = nil

  def initialize(args: nil, options: nil)
    init_logger()
    @options = options.nil? ? { :logger_level => 0 } : options
    if !args.nil?
      parse_args(args)
    end

    validate_options()
  end

  def get_version_string
    return @@VERSION.join(".")
  end

  def init_logger
    @logger = Logger.new(STDERR)
    @logger.level = Logger::WARN
  end

  def init_opt_parser
    opt_parser = OptionParser.new do |opts|
      opts.banner = @@BANNER

      opts.separator ""

      opts.on_tail("-h", "--help", "Show this message") do
        puts "#{$0}, Version #{get_version_string}"
        puts
        puts opts
        exit
      end

      opts.on_tail("-v", "--verbose", "Output debugging messages (specify `-v -v' for more verbose debugging)") do
        @options[:logger_level] = @options[:logger_level] + 1
        @logger.level = LOG_LEVELS[@options[:logger_level]]
      end

      # Another typical switch to print the version.
      opts.on_tail("--version", "Show this script's version") do
        puts get_version_string
        exit
      end

    end

    opt_parser

  end

  def parse_args(args = nil)
    opt_parser = init_opt_parser()
    add_additional_options(opt_parser)
    if !args.nil?
      opt_parser.parse!(args)
    end
  end

  # Override this to add additional options to the opt_parser before parsing command-line args
  def add_additional_options(opt_parser)
  end

  # Override this to add custom validations and default initializations for options
  def validate_options
  end

  def run
    raise UnOperationException.new "The `run' method must be implemented by subclasses"
  end

  class UnOperationException < RuntimeError
    def initialize(msg = "")
      super msg
    end
  end

end