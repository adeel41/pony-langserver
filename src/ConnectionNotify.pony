use "net"
use "Debug"
use "package:types"


class LanguageServerTCPConnectionNotify is TCPConnectionNotify
    let _processor:RawMessageProcessor = RawMessageProcessor 

    fun ref accepted(conn: TCPConnection ref) =>
    try
      (let host, let service) = conn.remote_address().name()?
      Debug("PLS: Accepted connection " + host + ":" + service)
    else
        Debug("PLS: There was an issue accepting the connection")
    end

    fun ref connecting(conn: TCPConnection ref, count: U32 val) : None val =>
        Debug("PLS: Connecting....")

    fun ref connected(conn: TCPConnection ref) =>
        Debug("PLS: Connected...\r\n")

    fun ref received(conn: TCPConnection ref, data: Array[U8] iso, times: USize) : Bool =>        
        let received_data = String.from_array(consume data)
        _processor.process(conn, received_data)
        true

    fun ref connect_failed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Failed")

    fun ref closed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Closed")
