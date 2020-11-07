use "ponytest"
use "../../../types"

class iso _TestClientInfo is UnitTest

    fun name(): String => "decoders:initialize:ClientInfo"
    fun apply(h: TestHelper) =>
        let data': (ClientInfo | None) = TestData.getClientInfo()
        match data'
        | let data: ClientInfo =>
            h.assert_eq[String]("vscode", data.name)
            h.assert_false(data.version is None, "version is None")
            h.assert_eq[String]("1.50.1", try data.version as String else "" end)
        else
            h.fail("data is not of type ClientInfo")
        end
