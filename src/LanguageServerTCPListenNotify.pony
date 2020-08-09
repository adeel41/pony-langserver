use "net"
use "Debug"

class LanguageServerTCPListenNotify is TCPListenNotify
    fun ref connected(listen: TCPListener ref) : TCPConnectionNotify iso^ =>
        Debug("PLS: Connected")
        LanguageServerTCPConnectionNotify

    fun ref listening(listen: TCPListener ref) : None val =>
        Debug("PLS: Server Listening...")

    fun ref not_listening(listen: TCPListener ref) =>
        try
            (let host, let service) = listen.local_address().name()?
            Debug("PLS: Unable to listen on the host: " + host + " and port: " + service )
        else
            Debug("PLS: Can't listen. No info about client")
        end

    fun ref closed(listen: TCPListener ref) =>
        Debug("PLS: Listener is closed")