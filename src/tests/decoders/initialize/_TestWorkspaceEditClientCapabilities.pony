use "ponytest"
use "../../../types"

class iso _TestWorkspaceEditClientCapabilities is UnitTest

    fun name(): String => "types:WorkspaceEditClientCapabilities"
    fun apply(h: TestHelper) =>
        let data': (WorkspaceEditClientCapabilities | None) = TestData.getWorkspaceEditClientCapabilities()
        match data'
        | let data: WorkspaceEditClientCapabilities =>
            h.assert_true(try data.documentChanges as Bool else false end)
            h.assert_true(try data.documentChanges as Bool else false end)
            let resourceOperationsExpected:Array[ResourceOperationKind] = [ResourceOperationKindCreate;ResourceOperationKindRename;ResourceOperationKindDelete]
            let emptyResourceOperations: Array[ResourceOperationKind] = []

            match data.resourceOperations
            | let resourceOperations: Array[ResourceOperationKind] =>
                h.assert_true( try resourceOperations(0)? is ResourceOperationKindCreate else false end )
                h.assert_true( try resourceOperations(1)? is ResourceOperationKindRename else false end )
                h.assert_true( try resourceOperations(2)? is ResourceOperationKindDelete else false end )
            else
                h.fail("data.resourceOperations does not contain ResourceOperationKind")
            end                
            h.assert_true(data.failureHandling is FailureHandlingKindTextOnlyTransactional)
        else
            h.fail("data is not of type WorkspaceEditClientCapabilities")
        end
