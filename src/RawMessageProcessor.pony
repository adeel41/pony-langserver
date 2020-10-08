use "net"
use "Debug"
use "json"
use "package:types"
use "valbytes"
use handlers = "package:handlers"

class RawMessageProcessor
    var _messageLength: USize = USize.from[I32](0)

    fun ref process(conn: TCPConnection ref, data: String val) =>
        let lines:Array[String] = data.split("\r\n")

        for line in lines.values() do             
            var ba = _process_line(line, conn)
            while ba.size().i32() > 1 do 
                ba = _process_line(ba.string(), conn)
            end
        end
        true

    fun ref _process_line(line: String, conn: TCPConnection) : ByteArrays =>
        let contentLengthText = "Content-Length: "
        let contentLengthLength = contentLengthText.size()

        var ba = ByteArrays(line.array())
        if ( ba.take(contentLengthLength).string() == contentLengthText) then
            let length = ba.drop(contentLengthLength).string()
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