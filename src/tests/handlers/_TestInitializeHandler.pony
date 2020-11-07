use "ponytest"
use "json"
use model = "../../model"
use "../../types"
use "../../handlers"

class _TestInitializeHandler is UnitTest
    fun name() : String => "handlers:initialize"
    fun apply(h: TestHelper) =>
        let app = model.App
        let params_json = TestData.get_initialize_params()
        let params = InitializeParams(params_json)

        InitializeHandler.handle(app, params, 1)
        h.assert_eq[String]("vscode", try (app.client as model.Client).name else "" end)
        h.assert_eq[String]("1.50.1", try (app.client as model.Client).version else "" end)

        h.assert_eq[String]("net_ssl", try (app.workspace as model.Workspace).name else "" end )    
        h.assert_eq[String]("d:\\Coding\\Pony\\net_ssl", try (app.workspace as model.Workspace).rootPath else "" end )    
        h.assert_eq[String]("file:///d%3A/Coding/Pony/net_ssl", try (app.workspace as model.Workspace).rootUri else "" end )    