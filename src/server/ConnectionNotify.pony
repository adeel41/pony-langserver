use "net"
use "Debug"
use "../types"

class LanguageServerTCPConnectionNotify is TCPConnectionNotify
    let _messageReader: RawMessageReader = RawMessageReader 

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
        Debug("DATA: " + received_data)
        _messageReader.read(received_data)
        let envelopes' = _messageReader.get_envelopes()
        match envelopes'
        | let envelopes: Array[Envelope] =>
            for envelope in envelopes.values() do
                //Debug("Request: " + envelope.content)
                match envelope.handle()
                | let response_message: ResponseMessage =>
                    let sendEnvelope = Envelope.from_json(response_message.to_json())
                    let response = sendEnvelope.stringify()
                    Debug("Response: " + response + "\r\n")
                    conn.write(response)
                end
            end

        end
        false

    fun ref connect_failed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Failed")

    fun ref closed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Closed")
