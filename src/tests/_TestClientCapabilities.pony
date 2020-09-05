use "ponytest"
use "../types"

class iso _TestClientCapabilities is UnitTest

    fun name(): String => "ClientCapabilities"
    fun apply(h: TestHelper) =>
        match TestData.getClientCapabilities() 
        | let data: ClientCapabilities =>
            h.assert_false(data.workspace is None, "workspace is set to None")
            h.assert_false(data.textDocument is None, "textDocument is set to None")
            h.assert_false(data.window is None, "window is set to None")
        else
            h.fail("data is not of type ClientCapabilities")
        end
