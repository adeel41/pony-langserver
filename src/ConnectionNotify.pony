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

    fun ref received(conn: TCPConnection ref, data: Array[U8] iso, times: USize) : Bool =>
        let received_data = String.from_array(consume data)
        //Debug("Request: " + received_data)
        let lines:Array[String] = received_data.split("\r\n")

        for line in lines.values() do 
            var ba = process_message(line, conn)
            while ba.size().i32() > 1 do 
                ba = process_message(ba.string(), conn)
            end
        end
        
        true
        //conn.close()

    fun ref process_message(line: String, conn: TCPConnection) : ByteArrays =>
        let contentLengthText = "Content-Length: "
        let contentLengthLength = contentLengthText.size()

        var ba = ByteArrays(line.array())
        if ( ba.take(contentLengthLength).string() == contentLengthText) then
            let length = ba.drop(contentLengthLength).string()
            Debug("Length: " + length)
            _messageLength = USize.from[I32](try length.i32()? else 0 end)
        elseif ba.string(0,1) == "{" then
            let theMessage = ba.take(_messageLength).string()                
            Debug("Message: " + theMessage )
            let envelope = Envelope(_messageLength.u16(), theMessage)
            match EnvelopProcessor.process(envelope)
            | let response_message: ResponseMessage =>
                let sendEnvelope = Envelope.from_json(response_message.to_json())
                let response = sendEnvelope.stringify()
                Debug("Response: " + response + "\r\n")
                conn.write(response)
            end
        end
        ba = ba.drop(_messageLength)
        ba

    fun ref connect_failed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Failed")

    fun ref closed(conn: TCPConnection ref) =>
        Debug("PLS: Connection Closed")

    // fun ref sent(conn: TCPConnection ref, data: (String val | Array[U8 val] val)) : (String val | Array[U8 val] val) =>
    //     Debug("PLS: Data sent")
    //     data
