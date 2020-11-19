use "peg"
use "debug"
use "collections"


primitive PonyDocumentParser
    fun get_pony_peg() : String =>
        """
LETTER <- 'a'..'z' / 'A'..'Z'

ClassName <- (LETTER)+
ClassName <- '_' ClassName

ClassStatement <- "class" ( )

CLASS <- "class"
class <-
  ("type" / "interface" / "trait" / "primitive" / "class" / "actor")
  cap?
  ID
  typeparams?
  ("is" type)?
  STRING?
  members
        
DIGIT19 <- '1'..'9'
DIGIT <- '0'..'9'
DIGITS <- (DIGIT / '_')+
HEX <- DIGIT / 'a'..'f' / 'A'..'F'
BINARY <- '0'..'1'

INT <-
  (DIGIT19 DIGITS / DIGIT) /
  ("0x" HEX (HEX / '_')*) /
  ("0b" BINARY (BINARY / '_')*) /
  '\'' (ESC / !'\'' !'\\' .)* '\''
FRAC <- '.' DIGITS
EXP <- ('e' / 'E') ('-' / '+')? DIGITS
FLOAT <- INT FRAC? EXP?

STRING <-
  '\"' (ESC / !'\"' !'\\' .)* '\"' /
  TRIPLE (!TRIPLE .)* TRIPLE '\"'*
TRIPLE <- "\"\"\""

ESC <-
  '\\'
    ('a' / 'b' / 'e' / 'f' / 'n' / 'r' / 't' / 'v' / '\\' / '0'/ '\'' / '\"') /
  "\\x" HEX HEX /
  "\\u" HEX HEX HEX HEX /
  "\\U" HEX HEX HEX HEX HEX HEX

whitespace <- (' ' / '\t' / '\r' / '\n')+
linecomment <- "//" (!'\r' !'\n' .)*
nestedcomment <- "/*" ((!"/*" !"*/" .) / nestedcomment)* "*/"

IDSTART <- '_' / LETTER
IDCONT <- IDSTART / DIGIT / '\''
ID <- IDSTART IDCONT*

bool <- ("true" !IDCONT) / ("false" !IDCONT)
array <- -'[' (-"as" type -':')? seq -']'
object <- -"object" cap? (-"is" type)? members -"end"




        
use <- -"use" (ID -"=")? (STRING / useffi) (-"if" infix)?

useffi <- "@" (ID / STRING) typeargs -"(" params? -")" "?"?

class <-
  ("type" / "interface" / "trait" / "primitive" / "class" / "actor")
  cap?
  ID
  typeparams?
  ("is" type)?
  STRING?
  members

members <- field* method*

field <- ("var" / "let" / "embed") ID -":" type (-"=" infix)?

method <-
  ("new" / "fun" / "be") cap? ID typeparams? -"(" params? -")" (-":" type)? "?"?
  STRING? (-"if" seq)? (-"=>" seq)?

// TODO: all the clustering stuff

atom <-
  ("this" !IDCONT) / bool / ID / FLOAT / INT / STRING /
  -'(' seq -')' / array / object / lambda / "__loc"

lambda <-
  -'{' cap? ID? typeparams? -'(' params? -')' captures? (-':' type)? '?'? '=>' seq '}' cap?
ffi <- '@' (ID / STRING) typeargs? -'(' positional? named? -')' '?'?

// TODO: ID should reject keywords, or reject them later on?








start <- module
hidden <- (whitespace / linecomment / nestedcomment)+"""

    fun parse(content: String val) =>
        let hello = "Hello"
        // let peg = Source.from_string(get_pony_peg())
        // let source = Source.from_string(content)
        // match recover val PegCompiler(peg) end
        // | let p: Parser val =>
        //     peg_run(p, source)
        // | let errors: Array[PegError] val =>
        //     for e in errors.values() do
        //         for m in e.markers() do 
        //             (let line, let col) = Position(m._1, m._2)
        //             let source_position = Position.text(m._1, m._2, col)
        //             //let indent = Position.indent(source_position, col)
        //             let mark = recover String(m._3) end
        //             for i in Range(0, m._3) do
        //                 mark.append("^")
        //             end

        //             let line_text: String = line.string()
        //             let line_indent = Position.indent(line_text, line_text.size() + 1)

        //             Debug("Line: " + line_text + "\tSource: " + source_position)
        //         end
        //         // env.out.writev(PegFormatError.console(e))
        //     end
        // end

    // fun peg_run(p: Parser val, source: Source) =>
    //     let parse_result = p.parse(source, USize.from[I64](0))
    //     match parse_result
    //     | (let offset: USize, let r: Parser) =>
    //         Debug("Got an offset")
    //     else
    //         Debug("something else")
    //     end
