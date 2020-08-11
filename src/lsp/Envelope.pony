use "Debug"

class Envelope
    let length: U16
    let content: String

    new create(data:Array[U8] val) =>
        let str = String.from_array(data)
        let splits:Array[String] = str.split("\r\n")
        length = try splits(0)?.substring(16).u16()? else 0 end
        content = try splits(splits.size()-1)? else "" end

