use "valbytes"

class SizeRestrictedMessage
    let length: USize
    var _builder: ByteArrays

    new create(length': USize) =>
        length = length'
        _builder = ByteArrays

    fun ref append(message: String) : (Bool, ByteArrays) =>
        _builder = _builder.add(message)
        let completed = _builder.size() >= length
        let result = _builder.take(length)
        let extra = _builder.drop(length)
        _builder = result
        (completed, extra)

    fun get_content() : String =>
        _builder.string()

