use "ponytest"

class _TestOneMessageInRequest is UnitTest
    fun name() : String => "raw_messages:OneMessage"
    fun apply(h: TestHelper) =>
        h.assert_true(false)
