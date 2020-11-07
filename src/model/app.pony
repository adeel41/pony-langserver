class App
    var client: ( Client | None )
    var workspace: (Workspace | None)
    let documents: Array[Document]
    let activeDocument: (Document | None)

    new create() =>
        client = None
        workspace = None
        documents = Array[Document](0)
        activeDocument = None

    fun ref initialize(client': Client, workspace': (Workspace | None)) =>
        client = client'
        workspace = workspace'


class Workspace
    let name: String
    let rootPath : String
    let rootUri : String

    new create(name': String, rootPath': String, rootUri': String) =>
        name = name'
        rootPath = rootPath'
        rootUri = rootUri'

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

primitive DocumentTypePony
primitive DocumentTypeOther
type DocumentType is (DocumentTypePony | DocumentTypeOther)