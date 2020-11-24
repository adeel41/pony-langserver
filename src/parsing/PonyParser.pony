use "ponycc"
use "ponycc/ast"
use "ponycc/pass/parse"
use "debug"
use "../model"


primitive PonyParser
    fun get_document(str: String) =>
        let source = Source(str, "")
        BuildCompiler[Source, Module](Parse)
        .on_errors({(pass, errs) =>
            for err in errs.values() do
                Debug(err.message)
                (let pos1, let pos2) = err.pos.show_in_line()
                Debug(pos1)
                Debug(pos2)
            end
            Debug("Unexpected " + pass.name() + " error(s) occurred.")
        })
        .on_complete({(module: Module) =>
            //Debug(module)
            Debug("Total Type Declarations: " + module.type_decls().size().string() )
            for (index, value) in module.type_decls().pairs() do
                let name = value.name().value()
                Debug("Name: " + name)
                Debug("Content: \r\n" + value.pos().string())
                Debug("\r\nEntire Line: \r\n" + value.pos().entire_line().string())
                (let l1, let l2) = value.pos().show_in_line()
                Debug("\r\n" + l1)
                Debug(l2)

                // let sourcePos = value.pos()
                // let source = sourcePos.source() 
                // let offset = sourcePos.offset()
                // let length = sourcePos.length()

                // Debug("Length: " + length.string())
                // Debug("Offset: " + offset.string())
            end

        })
        .apply(source)
