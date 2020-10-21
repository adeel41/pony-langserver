use "net"
use "Debug"
use "json"
use "../types"
use "valbytes"

class RawMessageReader
    var _messageLength: USize = USize.from[I32](0)
    var _envelopes : (Array[Envelope] | None) = None

    fun get_message_size() : USize =>
        _messageLength

    fun ref read(data: String val) =>
        let lines:Array[String] = data.split("\r\n")

        for line in lines.values() do             
            var ba = _process_line(line)
            while ba.size().i32() > 1 do 
                ba = _process_line(ba.string())
            end
        end
        true

    fun ref _process_line(line: String) : ByteArrays =>
        let contentLengthText = "Content-Length: "
        let contentLengthLength = contentLengthText.size()

        var ba = ByteArrays(line.array())
        if ( ba.take(contentLengthLength).string() == contentLengthText) then
            let length = ba.drop(contentLengthLength).string()
            _messageLength = USize.from[I32](try length.i32()? else 0 end)
        elseif ba.string(0,1) == "{" then
            let theMessage = ba.take(_messageLength).string()
            //Debug("Message: " + theMessage )

            let envelope = Envelope(_messageLength.u16(), theMessage)
            if _envelopes is None then
                _envelopes = Array[Envelope](4)
            end
            try (_envelopes as Array[Envelope]).push(envelope) end
        end
        ba = ba.drop(_messageLength)
        ba


    fun ref get_envelopes() : ( Array[Envelope]^ | None ) =>
        var result: ( Array[Envelope]^ | None ) = None
        
        match _envelopes
        | let envelopes' : Array[Envelope] =>
            let envelopes = Array[Envelope]
            for v in envelopes'.values() do 
                envelopes.push(v)
            end
            result = envelopes.clone()
        end
        _envelopes = None
        _messageLength = USize.from[I32](0)
        result
