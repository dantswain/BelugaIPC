require 'rhubarb'

module BelugaIPC
  class Server < Rhubarb::Server

    @@num_bots = 4

    # this function is useful to set initial data values and is
    # especially useful in testing
    def self.reset_data
      @@positions = [[0.0, 0.0, 0.0]]*@@num_bots
      @@controls = ({ :waypoint =>  [[0.0, 0.0, 0.0]]*@@num_bots,
                      :kinematics => [[0.0, 0.0, 0.0]]*@@num_bots })
      @@control_mode = :waypoint
    end

    # makes sure the data is reset when we launch a server
    reset_data

    @@cmd_control = ({ :name => "control",
                       :modes => {
                           :waypoint => { :setArgs => 3 },
                           :kinematics => { :setArgs => 3 }
                       },
                       :maxIndex => @@num_bots-1
    })


    add_indexed_get_set_command :name => "position", :setArgs => 3, :maxIndex => 3
    add_indexed_get_set_command @@cmd_control

    def getControlMode
      @@control_mode
    end

    def setControlMode mode
      return false unless @@cmd_control[:modes].has_key?(mode.to_sym)
      @@control_mode = mode.to_sym
      return true
    end

    def getControl(i)
      @@controls[@@control_mode][i].collect{ |c| c.to_f}.join(" ")
    end

    def setControl(i, args)
      @@controls[@@control_mode][i] = args.collect{ |a| a.to_f }
      getControl(i)
    end

    def getPosition(i)
      @@positions[i].collect{ |p| p.to_f }.join(" ")
    end

    def setPosition(i, args)
      @@positions[i] = args.collect{ |a| a.to_f }
      getPosition(i)
    end

    def respondToPing(words)
    "PONG!"
    end

    def welcomeMessage(args)
      "Welcome to Beluga IPC Server, client #{@@client_id}."
    end

  end
end

