class App
    var _client: ( Client | None )
    var _workspace: (Workspace | None)
    let activeDocument: (Document | None)

    new create() =>
        _client = None
        _workspace = None
        activeDocument = None

    fun ref initialize(client': Client, workspace': (Workspace | None)) =>
        _client = client'
        _workspace = workspace'

    fun get_client() : Client box ? => _client as Client box


class Workspace
    let name: String
    let rootPath : String
    let rootUri : String
    let documents: Array[Document]

    new create(name': String, rootPath': String, rootUri': String) =>
        name = name'
        rootPath = rootPath'
        rootUri = rootUri'
        documents = Array[Document](0)

class Client
    let name: String
    let version: String

    new create(name': String, version': String) =>
        name = name'
        version = version'

    new empty() =>
        name = ""
        version = ""

class Document
    let name: String
    let documentType: DocumentType

    new create(name': String, documentType': DocumentType) =>
        name = name'
        documentType = documentType'

primitive DocumentTypeCorralLock
primitive DocumentTypeCorral
primitive DocumentTypePony
primitive DocumentTypeOther
type DocumentType is (DocumentTypePony | DocumentTypeOther | DocumentTypeCorral | DocumentTypeCorralLock)