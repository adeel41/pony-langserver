use "json"
use "../../../../types"

primitive TestData
    fun get_json() : ( JsonObject | None ) =>
        let content = """{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"file:///d%3A/Coding/Pony/http_server/http_server/handler.pony","languageId":"pony","version":1,"text":"interface Handler\n  \"\"\"\n  This is the interface through which HTTP requests are delivered *to*\n  application code and through which HTTP responses are sent to the underlying connection.\n\n  Instances of a Handler are executed in the context of the `Session` actor so most of them should be\n  passing data on to a processing actor.\n\n  Each `Session` must have a unique instance of the handler. The\n  application code does not necessarily know when an `Session` is created,\n  so the application must provide an instance of `HandlerFactory` that\n  will be called at the appropriate time.\n\n  ### Receiving Requests\n\n  When an [Request](http-Request.md) is received on an [Session](http-Session.md) actor,\n  the corresponding [Handler.apply](http-Handler.md#apply) method is called\n  with the request and a [RequestID](http-RequestID). The [Request](http-Request.md)\n  contains the information extracted from HTTP Headers and the Request Line, but it does not\n  contain any body data. It is sent to [Handler.apply](http-Handler.md#apply) before the body\n  is fully received.\n\n  If the request has a body, its raw data is sent to the [Handler.chunk](http-Handler.md#chunk) method\n  together with the [RequestID](http-RequestID.md) of the request it belongs to.\n\n  Once all body data is received, [Handler.finished](http-Handler.md#finished) is called with the\n  [RequestID](http-RequestID.md) of the request it belongs to. Now is the time to act on the full body data,\n  if it hasn't been processed yet.\n\n  The [RequestID](http-Requestid.md) must be kept around for sending the response for this request.\n  This way the session can ensure, all responses are sent in the same order as they have been received,\n  which is required for HTTP pipelining. This way processing responses can be passed to other actors and\n  processing can take arbitrary times. The [Session](http-Session.md) will take care of sending\n  the responses in the correct order.\n\n  It is guaranteed that the call sequence is always:\n\n  - exactly once:       `apply(request_n, requestid_n)`\n  - zero or more times: `chunk(data, requestid_n)`\n  - exactly once:       `finished(requestid_n)`\n\n  And so on for `requestid_(n + 1)`. Only after `finished` has been called for a\n  `RequestID`, the next request will be received by the Handler instance, there will\n  be no interleaving. So it is save to keep state for the given request in a Handler between calls to `apply`\n  and `finished`.\n\n  #### Failures and Cancelling\n\n  If a [Session](http-Session.md) experienced faulty requests, the [Handler](http-Handler.md)\n  is notified via [Handler.failed](http-Handler.md#failed).\n\n  If the underlying connection to a [Session](http-Session.md) has been closed,\n  the [Handler](http-Handler.md) is notified via [Handler.closed](http-Handler.md#closed).\n\n  ### Sending Responses\n\n  A handler is instantiated using a [HandlerFactory](http-HandlerFactory.md), which passes an instance of\n  [Session](http-Session.md) to be used in constructing a handler.\n\n  A Session is required to be able to send responses.\n  See the docs for [Session](http-Session.md) for ways to send responses.\n\n  Example Handler:\n\n  ```pony\n  use \"http\"\n  use \"valbytes\"\n\n  class MyHandler is Handler\n    let _session: Session\n\n    var _path: String = \"\"\n    var _body: ByteArrays = ByteArrays\n\n    new create(session: Session) =>\n      _session = session\n\n    fun ref apply(request: Request val, request_id: RequestID): Any =>\n      _path = request.uri().path\n\n    fun ref chunk(data: ByteSeq val, request_id: RequestID) =>\n      _body = _body + data\n\n    fun ref finished(request_id: RequestID) =>\n      _session.send_raw(\n        Responses.builder()\n          .set_status(StatusOk)\n          .add_header(\"Content-Length\", (_body.size() + _path.size() + 13).string())\n          .add_header(\"Content-Type\", \"text/plain\")\n          .finish_headers()\n          .add_chunk(\"received \")\n          .add_chunk((_body = ByteArrays).array())\n          .add_chunk(\" at \")\n          .add_chunk(_path)\n          .build(),\n        request_id\n      )\n      _session.send_finished(request_id)\n  ```\n\n  \"\"\"\n  fun ref apply(request: Request val, request_id: RequestID): Any =>\n    \"\"\"\n    Notification of an incoming message.\n\n    Only one HTTP message will be processed at a time, and that starts\n    with a call to this method.\n    \"\"\"\n\n  fun ref chunk(data: ByteSeq val, request_id: RequestID) =>\n    \"\"\"\n    Notification of incoming body data. The body belongs to the most\n    recent `Request` delivered by an `apply` notification.\n    \"\"\"\n\n  fun ref finished(request_id: RequestID) =>\n    \"\"\"\n    Notification that no more body chunks are coming. Delivery of this HTTP\n    message is complete.\n    \"\"\"\n\n  fun ref cancelled(request_id: RequestID) =>\n    \"\"\"\n    Notification that sending a response has been cancelled locally,\n    e.g. by closing the server or manually cancelling a single request.\n    \"\"\"\n\n  fun ref failed(reason: RequestParseError, request_id: RequestID) =>\n    \"\"\"\n    Notification about failure parsing HTTP requests.\n    \"\"\"\n\n  fun ref closed() =>\n    \"\"\"\n    Notification that the underlying connection has been closed.\n    \"\"\"\n\n  fun ref throttled() =>\n    \"\"\"\n    Notification that the session temporarily can not accept more data.\n    \"\"\"\n\n  fun ref unthrottled() =>\n    \"\"\"\n    Notification that the session can resume accepting data.\n    \"\"\"\n\n\ninterface HandlerFactory\n  \"\"\"\n  The TCP connections that underlie HTTP sessions get created within\n  the `http` package at times that the application code can not\n  predict. Yet, the application code has to provide custom hooks into\n  these connections as they are created. To accomplish this, the\n  application code provides an instance of a `class` that implements\n  this interface.\n\n  The `HandlerFactory.apply` method will be called when a new\n  `Session` is created, giving the application a chance to create\n  an instance of its own `Handler`. This happens on both\n  client and server ends.\n  \"\"\"\n\n  fun apply(session: Session): Handler ref^\n    \"\"\"\n    Called by the [Session](http-Session.md) when it needs a new instance of the\n    application's [Handler](http-Handler.md). It is suggested that the\n    `session` value be passed to the constructor for the new\n    [Handler](http-Handler.md), you will need it for sending stuff back.\n\n    This part must be implemented, as there might be more paramaters\n    that need to be passed for creating a Handler.\n    \"\"\"\n\ninterface HandlerWithoutContext is Handler\n  \"\"\"\n  Simple [Handler](http-Handler.md) that can be constructed\n  with only a Session.\n  \"\"\"\n  new create(session: Session)\n\n\nprimitive SimpleHandlerFactory[T: HandlerWithoutContext]\n  \"\"\"\n  HandlerFactory for a HandlerWithoutContext.\n\n  Just create it like:\n\n  ```pony\n  let server =\n    Server(\n      ...,\n      SimpleHandlerFactory[MySimpleHandler],\n      ...\n    )\n  ```\n\n  \"\"\"\n  fun apply(session: Session): Handler ref^ =>\n    T.create(session)\n"}}}"""
        try
            let doc = JsonDoc
            doc.parse(content)?
            doc.data as JsonObject
        end

    fun get_params() : (JsonObject | None) =>
        try 
            let root = TestData.get_json() as JsonObject
            (root.data("params")? as JsonObject)
        end

    fun get_textDocument() : (TextDocumentItem | None) =>
        try 
            let params = TestData.get_params() as JsonObject
            let json = params.data("textDocument")? as JsonObject
            TextDocumentItem(json)
        end
