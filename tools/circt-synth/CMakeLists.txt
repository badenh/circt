add_circt_tool(circt-synth circt-synth.cpp)
target_link_libraries(circt-synth
  PRIVATE
  CIRCTAIG
  CIRCTAIGToComb
  CIRCTAIGAnalysis
  CIRCTComb
  CIRCTDebug
  CIRCTEmit
  CIRCTHW
  CIRCTLTL
  CIRCTOM
  CIRCTSeq
  CIRCTSim
  CIRCTSV
  CIRCTSVTransforms
  CIRCTSynthesis
  CIRCTTransforms
  CIRCTVerif
  MLIRBytecodeWriter
  MLIRIR
  MLIRParser
  LLVMSupport
)

llvm_update_compile_flags(circt-synth)
mlir_check_all_link_libraries(circt-synth)
