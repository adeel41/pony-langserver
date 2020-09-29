class ResponseMessage
    let id: (I64 | String | None)
    let result: (I64 | String | Bool | None) //also supports object
    let error': (ResponseError | None) 

    new create(id': (I64 | String), result': (I64 | String | Bool) ) =>
        id = id'
        result = result'
        error' = None


class ResponseError
    let code: I64
    let message: String
    let data: (I64 | String | Bool | None)

    new create(code': I64, message': String) =>
        code = code'
        message = message'
        data = None