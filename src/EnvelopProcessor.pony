use "types"
use "handlers"

primitive EnvelopProcessor
    fun process(envelope: Envelope) : (ResponseMessage | None) =>
        var message: (RequestMessage | Notification | None) = None
        try 
            message = envelope.open()?
        else
            return ResponseMessage.failed(1, ResponseError(ErrorCodes.parseError(), "parse error"))            
        end

        match message
        | let rm: RequestMessage =>
            return MessageHandlerFactory.handle(rm)
        | let n: Notification =>
            NotificationHandlerFactory.handle(n)
        else
            ResponseMessage.failed(2, ResponseError(ErrorCodes.internalError(), "Internal Error. Couldn't handle message request"))
        end
