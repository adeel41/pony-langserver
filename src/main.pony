use "net"
use "Debug"
use "package:types"

actor Main
    new create(env: Env) =>
        let port = try env.args.apply(1)? else "9192" end
        env.out.print("Starting Pony Language Server on port: " + port)
        try
            TCPListener( env.root as AmbientAuth, 
                recover LanguageServerTCPListenNotify end,
                "127.0.0.1",
                port
            )
        else
            env.out.print("No listener")
        end
        
actor RequestMessageHandler
    be handle(requestMessage: RequestMessage val, env: Env) =>
        env.out.print("I am handling this")