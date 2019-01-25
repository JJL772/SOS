
import settings as settings

Compilers = dict()

class CompilerType():
	UNDEFINED 		=	0
	ASSEMBLER_ATT	=	1
	ASSEMBLER_INTEL	=	2
	C				=	3
	CXX				=	4
	LINKER			=	5

def register_compiler(name, compiler):
	Compilers[name] = compiler

class CompilerBase():
	RefName = ""

	CompilerType = CompilerType.UNDEFINED

	CompilerName = ""

	IncludeDirectoryPrefix = ""

	LinkDirectoryPrefix = ""

	LinkLibraryPrefix = ""

	MacroPrefix = ""

	UndefineMacroPrefix = ""

	CompilerCommand = ""

	OutputFilePrefix = ""

	ListfilePrefix = ""

	ErrorMessageFilePrefix = ""

	def invoke(self, build_config):
		raise NotImplementedError()

class NASMCompiler(CompilerBase):
	RefName = "nasm"

	CompilerType = CompilerType.ASSEMBLER_INTEL

	CompilerName = "NASM (Netwide Assembler)"

	IncludeDirectoryPrefix = "-I"

	LinkDirectoryPrefix = "-L"

	LinkLibraryPrefix = ""

	MacroPrefix = "-D"

	UndefineMacroPrefix = "-U"

	CompilerCommand = settings.nasm_command

	OutputFilePrefix = "-o "

	ListfilePrefix = "-l "

	ErrorMessageFilePrefix = "-Z"
	
class ClangCompiler(CompilerBase):
	RefName = "clang"

	CompilerType = CompilerType.C

	CompilerName = "Clang"

	IncludeDirectoryPrefix = "-I "

	LinkDirectoryPrefix = "-L "

	LinkLibraryPrefix = "-l"

	MacroPrefix = "-D"

	UndefineMacroPrefix = "-U"

	CompilerCommand = settings.clang_command

	OutputFilePrefix = "-o "

	ListfilePrefix = ""

	ErrorMessageFilePrefix = ""

class LinkerCommand(CompilerBase):
	RefName = "ld"

	CompilerType = CompilerType.LINKER

	CompilerName = "ld"

	IncludeDirectoryPrefix = ""

	LinkDirectoryPrefix = "-L "

	LinkLibraryPrefix = "-l"

	MacroPrefix = ""