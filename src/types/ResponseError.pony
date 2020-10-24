use "json"

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
