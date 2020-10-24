use "Debug"
use "json"
use "../types"
use "../handlers"

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
        try
            doc.parse(content)?
        else
            (_, let errorMessage: String) = doc.parse_report()
            Debug("JSON ERROR: " + errorMessage)
        end

        if (doc.data as JsonObject).data.contains("id") then
            RequestMessage(doc.data as JsonObject)?            
        else
            Notification(doc.data as JsonObject)?
        end

    fun stringify() : String =>
        "Content-Length: " + (length.string()) + "\r\n\r\n" + content
    
    fun handle() : (ResponseMessage | None) =>
        var message: (RequestMessage | Notification | None) = None
        try 
            message = open()?
        // else
        //     return ResponseMessage.failed(1, ResponseError(ErrorCodes.parseError(), "parse error"))            
        end

        match message
        | let rm: RequestMessage =>
            return MessageHandlerFactory.handle(rm)
        | let n: Notification =>
            NotificationHandlerFactory.handle(n)
        // else
        //     ResponseMessage.failed(2, ResponseError(ErrorCodes.internalError(), "Internal Error. Couldn't handle message request"))
        end
