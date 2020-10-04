use "json"

class ResponseMessage
    let id: (I64 | String | None)
    let result: (I64 | String | Bool | InitializeResult | None)
    let responseError: (ResponseError | None)

    new create(id': (I64 | String), result': (I64 | String | Bool | InitializeResult) ) =>
        id = id'
        result = result'
        responseError = None

    new failed(id': (I64 | String), responseError': ResponseError) =>
        id = id'
        result = None
        responseError = responseError'

    fun to_json() : JsonObject =>
        let json = JsonObject
        json.data("jsonrpc") = "2.0"
        json.data("id") = id        

        match responseError
        | let re: ResponseError box =>
            json.data("error") = re.to_json()
        end

        match result
        | let obj: InitializeResult box =>
            json.data("result") = obj.to_json()
        | let int: I64 =>
            json.data("result") = int
        | let string: String =>
            json.data("result") = string
        | let bool: Bool =>
            json.data("result") = bool
        end

        json


class ResponseError
    let code: U32
    let message: String
    let data: (I64 | String | Bool | None)

    new create(code': U32, message': String) =>
        code = code'
        message = message'
        data = None

    fun to_json() : JsonObject =>
        let json = JsonObject
        json.data("code") = code.i64()
        json.data("message") = message
        json.data("data") = data
        json
