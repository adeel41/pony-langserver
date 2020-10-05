use "Debug"
use "json"

class Envelope
    let length: U16
    let content: String
    
    //should be changed to accept length and content directly
    new create(str:String) =>
        // let str = String.from_array(data)
        let splits:Array[String] = str.split("\r\n")
        length = try splits(0)?.substring(16).u16()? else 0 end
        content = try splits(splits.size()-1)? else "" end

    new from_json(json: JsonObject) =>
        let jsonDoc = JsonDoc
        jsonDoc.data = json
        content = jsonDoc.string()
        length = content.size().u16()

    fun open() : RequestMessage ref^ ? =>
        let doc = JsonDoc
        doc.parse(content)?
        RequestMessage(doc.data as JsonObject)?

    fun stringify() : String =>
        "Content-Length: " + (length.string()) + "\r\n\r\n" + content
    