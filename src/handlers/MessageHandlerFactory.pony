use "../types"

primitive MessageHandlerFactory    
    fun handle(message: RequestMessage) : ResponseMessage =>
        match message.get_params()
        | let params : InitializeParams =>
            InitializeHandler.handle(params)
        else
            ResponseMessage(1, false)
        end