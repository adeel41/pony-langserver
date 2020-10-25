use "net"
use "Debug"
use "json"
use "../types"
use "valbytes"

class RawMessageReader
    var _current_message: SizeRestrictedMessage = SizeRestrictedMessage(0)
    var _envelopes : (Array[Envelope] | None) = None

    fun get_message_size() : I32 =>
        _current_message.length.i32()

    fun ref read(data: String val) =>
        let lines:Array[String] = data.split("\r\n")

        for line in lines.values() do             
            var ba = _process_line(line)
            while ba.size().i32() > 1 do 
                ba = _process_line(ba.string())
            end
        end
        

    fun ref _process_line(line: String) : ByteArrays =>
        let contentLengthText = "Content-Length: "
        let contentLengthLength = contentLengthText.size()

        var ba = ByteArrays(line.array())
        if ( ba.take(contentLengthLength).string() == contentLengthText) then            
            let length = ba.drop(contentLengthLength).string()
            _current_message = SizeRestrictedMessage(USize.from[I32](try length.i32()? else 0 end))
            return ByteArrays
        elseif line == "" then
            return ByteArrays
        else
            (let completed, let extra) = _current_message.append(line)
            if completed then
                _add_envelope()
            end
            ba = extra
        end
        ba

    fun ref _add_envelope() =>
        let envelope = Envelope(_current_message.length.u16(), _current_message.get_content())
        if _envelopes is None then
            _envelopes = Array[Envelope](4)
        end
        try (_envelopes as Array[Envelope]).push(envelope) end


    fun ref get_envelopes() : ( Array[Envelope]^ | None ) =>
        var result: ( Array[Envelope]^ | None ) = None
        
        match _envelopes
        | let envelopes' : Array[Envelope] =>
            let envelopes = Array[Envelope]
            for v in envelopes'.values() do 
                envelopes.push(v)
            end
            result = envelopes
        _envelopes = None
        end
        result
