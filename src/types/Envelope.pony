use "Debug"
use "json"

class Envelope
    let length: U16
    let content: String
    
    new create(length': U16, content': String) =>
        length = length'
        content = content'

    new from_json(json: JsonObject) =>
        let jsonDoc = JsonDoc
        jsonDoc.data = json
        content = jsonDoc.string()
        length = content.size().u16()

    fun open() : (RequestMessage ref^ | Notification ref^) ? =>
        let doc = JsonDoc
        doc.parse(content)?
        if (doc.data as JsonObject).data.contains("id") then
            RequestMessage(doc.data as JsonObject)?            
        else
            Notification(doc.data as JsonObject)?
        end

    fun stringify() : String =>
        "Content-Length: " + (length.string()) + "\r\n\r\n" + content
    