use "ponytest"
use "../../types"

class iso _TestWorkspace is UnitTest
    fun name() : String => "types:Workspace"
    fun apply(h: TestHelper) =>
        let data' = TestData.getWorkspace()
        match data'
        | let workspace: Workspace =>
                h.assert_true(try workspace.applyEdit as Bool else false end)

                match workspace.didChangeConfiguration
                | let didChangeConfiguration: DidChangeConfigurationClientCapabilities =>
                    h.assert_true(try didChangeConfiguration.dynamicRegistration as Bool else false end)
                else
                    h.fail("didChangeConfiguration is not of type DidChangeConfigurationClientCapabilities")
                end

                match workspace.didChangeWatchedFiles
                | let didChangeWatchedFiles: DidChangeWatchedFilesClientCapabilities =>
                    h.assert_true(try didChangeWatchedFiles.dynamicRegistration as Bool else false end)
                else
                    h.fail("didChangeWatchedFiles is not of type DidChangeWatchedFilesClientCapabilities")
                end

                match workspace.symbol
                | let symbol: WorkspaceSymbolClientCapabilities =>
                    h.assert_true(try symbol.dynamicRegistration as Bool else false end )
                    h.assert_eq[I32](26, try ((symbol.symbolKind as SymbolKindValueSet).valueSet as Array[SymbolKind]).size().i32() else 0 end)
                else
                    h.fail("symbol is not of type WorkspaceSymbolClientCapabilities")
                end

                match workspace.executeCommand
                | let executeCommand: ExecuteCommandClientCapabilities =>
                    h.assert_true(try executeCommand.dynamicRegistration as Bool else false end)
                else
                    h.fail("executeCommand is not of type ExecuteCommandClientCapabilities")
                end

                h.assert_true(try workspace.configuration as Bool else false end)
                h.assert_true(try workspace.workspaceFolders as Bool else false end)

        else
            h.fail("workspace is not of type Workspace")
        end
        