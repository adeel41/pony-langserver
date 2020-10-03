use "net"
use "Debug"
use "json"
use "package:types"
use handlers = "package:handlers"

class LanguageServerTCPConnectionNotify is TCPConnectionNotify
    fun ref accepted(conn: TCPConnection ref) =>
    try
      (let host, let service) = conn.remote_address().name()?
      Debug("PLS: Accepted connection " + host + ":" + service)
      //conn.write("server says hi")
    else
        Debug("PLS: There was an issue accepting the connection")
    end

    fun ref connecting(conn: TCPConnection ref, count: U32 val) : None val =>
        Debug("PLS: Connecting....")

    fun ref connected(conn: TCPConnection ref) =>
        Debug("PLS: Connected...\r\n")
        //conn.write("hello world")

    fun ref received(conn: TCPConnection ref, data: Array[U8] iso, times: USize) : Bool =>
        let envelope = Envelope(consume data)
        Debug(envelope.content)
        
        let response_message: ResponseMessage = get_response_message(envelope)
        let jsonDoc = JsonDoc
        jsonDoc.data = response_message.to_json()
        let response = jsonDoc.string()
        Debug("Response: " + response)
        conn.write(response)        
        true
        //conn.close()

    fun get_response_message(envelope: Envelope) : ResponseMessage =>
        var message: (RequestMessage | None) = None
        try 
            message = envelope.open()?
        else
            return ResponseMessage.failed(1, ResponseError(ErrorCodes.parseError(), "parse error"))            
        end

        match message
        | let rm: RequestMessage =>
            let response = handlers.MessageHandlerFactory.handle(rm)
            return response
        else
            ResponseMessage.failed(2, ResponseError(ErrorCodes.internalError(), "Internal Error. Couldn't handle message request"))
        end
        


    fun ref connect_failed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Failed")

    fun ref closed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Closed")

    // fun ref sent(conn: TCPConnection ref, data: (String val | Array[U8 val] val)) : (String val | Array[U8 val] val) =>
    //     Debug("PLS: Data sent")
    //     data
