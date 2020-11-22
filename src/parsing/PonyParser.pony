use "ponycc"
use "ponycc/ast"
use "ponycc/pass/parse"
use "debug"

primitive PonyParser
    fun doIt(str: String) =>
        let source = Source(str, "")
        BuildCompiler[Source, Module](Parse)
        // .next[String](Print)
        .on_errors({(pass, errs) =>
            for err in errs.values() do
                Debug(err.message)
                (let pos1, let pos2) = err.pos.show_in_line()
                Debug(pos1)
                Debug(pos2)
            end
            Debug("Unexpected " + pass.name() + " error(s) occurred.")
        })
        .on_complete({(string) =>
            Debug(string)
        })
        .apply(source)
