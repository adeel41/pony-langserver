class App
    client: Client
    workspace: Workspace | None
    documents: Array[Document]
    activeDocument: Document

class Workspace
    let name: String
    let rootPath : String
    let roootUri : String

class Client
    let name: String
    let version: String

class Document
    name: String
    type: DocumentType


primitive DocumentTypePony
primitive DocumentTypeOther
type DocumentType is (DocumentTypePony | DocumentTypeOther)