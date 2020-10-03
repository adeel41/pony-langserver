use "../types"

primitive MessageHandlerFactory    
    fun handle(message: RequestMessage) : ResponseMessage =>
        match message.get_params()
        | let params : InitializeParams =>
            InitializeHandler.handle(params)
        else
            ResponseMessage.failed(3, ResponseError(123, "Message not supported on Server"))
        end