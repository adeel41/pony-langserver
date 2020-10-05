use "net"
use "Debug"
use "json"
use "package:types"
use "valbytes"
use handlers = "package:handlers"

class LanguageServerTCPConnectionNotify is TCPConnectionNotify
    var _messageLength: USize = USize.from[I32](0)

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
        let received_data = String.from_array(consume data)
        // Debug(received_data)
        let lines:Array[String] = received_data.split("\r\n")

        let contentLengthText = "Content-Length: "
        let contentLengthLength = contentLengthText.size()
        for line in lines.values() do 
            let ba = ByteArrays(line.array())
            if ( ba.take(contentLengthLength).string() == contentLengthText) then
                let length = ba.drop(contentLengthLength).string()
                Debug("The length is " + length)
                _messageLength = USize.from[I32](try length.i32()? else 0 end)
            elseif ba.string(0,1) == "{" then
                let theMessage = ba.take(_messageLength).string()
                Debug("The Message: " + theMessage )

                //todo: create envelop and return response

            end
        end
        
        //First check if starts with Content-. If yes then it is a header.

        // let envelope = Envelope(received_data)
        // Debug("Request: " + received_data)
        // try 
        //     if str.array()(0)? == 'C' then
        //         return true
        //     end
        // end
        
        // let response_message: ResponseMessage = get_response_message(envelope)
        // let sendEnvelope = Envelope.from_json(response_message.to_json())
        // let response = sendEnvelope.stringify()
        // Debug("Response: " + response + "\r\n\r\n")
        // conn.write("Content-Length: " + sendEnvelope.length.string() + "\r\n\r\n")
        // conn.write(sendEnvelope.content)

        // "Content-Length: " + (length.string()) + "\r\n\r\n" + content
        // conn.write(response)        
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
