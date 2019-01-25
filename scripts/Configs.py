import utils, Compiler

BuildConfigs = list()

def register_build_config(config):
	BuildConfigs.append(config)

class BuildConfigBase():
	BuildConfigName = "x86-debug"

	Files = list()

	PreprocessorDefinitions = dict()

	IncludeDirectories = list()

	LinkDirectories = list()

	LinkerScript = None

	LinkLibraries = list()

	UsedCompilers = list()

	ComplierSpecificFlags = dict()

	def add_compiler_specific_flags(self, compiler, flags):
		self.ComplierSpecificFlags[compiler] = flags

class Build_Debug_x86(BuildConfigBase):
	BuildConfigName = "x86-debug"

	PreprocessorDefinitions = ["X86", "_X86", "_x86_", "_DEBUG"]

	IncludeDirectories = [utils.src_dir + "/kernel/", utils.src_dir + "/kernel/arch/x86"]

	LinkDirectories = [utils.main_dir + "/build/"]

	LinkerScript = [utils.main_dir + "/scripts/link/kernel/kernel_main.ld"]

	LinkLibraries = []

	ComplierSpecificFlags = {
		Compiler.NASMCompiler.RefName: " -F elf32 -Zlogs/nasmout.txt ",
		Compiler.ClangCompiler: " --std=c99 -c "
	}

	UsedCompilers = {
		Compiler.NASMCompiler.RefName,
		Compiler.ClangCompiler.RefName,
		Compiler.LinkerCommand.RefName,
	}