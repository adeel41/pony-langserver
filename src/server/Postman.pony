use "debug"
use "net"
use "../types"
use model = "../model"

primitive Postman
    fun deliver(envelopes: Array[Envelope val] val, conn : TCPConnection, app: model.App, env: Env) =>
        for envelope in envelopes.values() do
            Debug("Request: " + envelope.content)
            match envelope.handle(app)
            | let response_message: ResponseMessage =>
                let sendEnvelope = Envelope.from_json(response_message.to_json())
                let response = sendEnvelope.stringify()
                Debug("Response: " + response + "\r\n")
                conn.write(response)
            end
        end
