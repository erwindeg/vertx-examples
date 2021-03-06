$vertx.create_net_client().connect(1234, "localhost") { |res,res_err|

  if (res_err == nil)
    socket = res
    socket.handler() { |buffer|
      puts "Net client receiving: #{buffer.to_string("UTF-8")}"
    }

    # Now send some data
    i = 0
    while (i < 10)
      str = "hello #{i}\n"
      puts "Net client sending: #{str}"
      socket.write(str)
      i+=1
    end
  else
    puts "Failed to connect #{res_err}"
  end
}
