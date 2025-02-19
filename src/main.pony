use "net"
use "Debug"
use "types"
use "server"

actor Main
    new create(env: Env) =>
        let port = try env.args.apply(1)? else "9192" end
        env.out.print("Starting Pony Language Server on port: " + port)
        try
            TCPListener( env.root as AmbientAuth, 
                recover LanguageServerTCPListenNotify(env) end,
                "127.0.0.1",
                port
            )
        else
            env.out.print("No listener")
        end