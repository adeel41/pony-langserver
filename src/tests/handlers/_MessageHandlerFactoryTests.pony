use "ponytest"
use "../../types"
use "../../handlers"
use "json"

class iso _MessageHandlerFactoryInitializeTest is UnitTest

    fun name() : String => "handlers:MessageHandlerFactory:Initialize"
    fun apply(h: TestHelper) =>
        let obj = JsonObject
        obj.data("id") = I64(1)
        obj.data("method") = "initialize"
        let params = JsonObject        
        obj.data("params") = params
        var request': (RequestMessage | None) = None
        try 
            request' = RequestMessage(obj)?
        else
            h.fail("Unable to create an instance of RequestMessage")
        end

        match request'
        | let request: RequestMessage =>
            let response = MessageHandlerFactory.handle(request)
            match response.result
            | let result: InitializeResult =>
                None
            else
                h.fail("response.result is not of type InitializeResult")
            end
        end
