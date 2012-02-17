require "spec_helper"

describe BelugaIPC::Manager do
  it "should be able to launch the server" do
    server = mock BelugaIPC::Server
    BelugaIPC::Server.should_receive(:new).and_return(server)
    server.should_receive(:start)
    server.stub(:join)

    BelugaIPC::Manager.launch
  end

  it "should launch and wait for a shutdown" do
    BelugaIPC::Manager.launch :audit => true

    s = TCPSocket.new('127.0.0.1', 1234)
    s.gets
    s.puts("S")
    s.close

    BelugaIPC::Manager.join
  end
end