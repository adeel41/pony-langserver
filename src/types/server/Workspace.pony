class Workspace
    let workspaceFolders: (WorkspaceFoldersServerCapabilities | None)
    
    new create(workspaceFolders': WorkspaceFoldersServerCapabilities) =>
        workspaceFolders = workspaceFolders'