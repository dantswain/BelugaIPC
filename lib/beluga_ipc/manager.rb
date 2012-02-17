module BelugaIPC
  class Manager
    def self.launch opts = Hash.new
      opts = {:port => 1234, :host => '127.0.0.1'}.merge(opts)
      @server = BelugaIPC::Server.new(opts[:port], opts[:host])
      @server.audit if opts[:audit]
      @server.start unless opts[:no_start]
      @server
    end

    def self.launch_as_daemon opts = Hash.new
      launch opts.merge(:no_start => true)
      Daemons.daemonize
      @server.start
    end

    def self.join
      @server.join unless @server.nil?
    end

    def self.launch_and_wait opts
      launch opts
      join
    end

    def self.stop
      @server.stop unless @server.nil?
    end
  end
end