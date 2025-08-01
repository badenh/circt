// RUN: split-file %s %t
// RUN: firld %t/Outer.mlir %t/Inner.mlir --base-circuit Outer | FileCheck %s

// CHECK: firrtl.circuit "Outer" attributes {annotations = [{class = "circt.test", target = "~Outer|Outer>io"}, {class = "circt.test", target = "~Outer|Inner>io"}]}
//--- Outer.mlir
module {
  firrtl.circuit "Outer" attributes {annotations = [{class = "circt.test", target = "~Outer|Outer>io"}]} {
    firrtl.module @Outer(in %i: !firrtl.uint<32>, out %o: !firrtl.uint<32>) attributes {convention = #firrtl<convention scalarized>} {
      %io = firrtl.wire : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      %probe = firrtl.wire : !firrtl.bundle<>
      %0 = firrtl.subfield %io[i] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %0, %i : !firrtl.uint<32>
      %1 = firrtl.subfield %io[o] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %o, %1 : !firrtl.uint<32>
      %inner_i, %inner_o = firrtl.instance inner interesting_name @Inner(in i: !firrtl.uint<32>, out o: !firrtl.uint<32>)
      %inner_io = firrtl.wire : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      %inner_probe = firrtl.wire : !firrtl.bundle<>
      %2 = firrtl.subfield %inner_io[i] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %inner_i, %2 : !firrtl.uint<32>
      %3 = firrtl.subfield %inner_io[o] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %3, %inner_o : !firrtl.uint<32>
      %4 = firrtl.subfield %inner_io[i] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      %5 = firrtl.subfield %io[i] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %4, %5 : !firrtl.uint<32>
      %6 = firrtl.subfield %io[o] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      %7 = firrtl.subfield %inner_io[o] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %6, %7 : !firrtl.uint<32>
    }
    firrtl.extmodule @Inner(in i: !firrtl.uint<32>, out o: !firrtl.uint<32>) attributes {defname = "Inner"}
  }
}

//--- Inner.mlir
module {
  firrtl.circuit "Inner" attributes {annotations = [{class = "circt.test", target = "~Inner|Inner>io"}]} {
    firrtl.module @Inner(in %i: !firrtl.uint<32>, out %o: !firrtl.uint<32>) attributes {convention = #firrtl<convention scalarized>} {
      %io = firrtl.wire : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      %probe = firrtl.wire : !firrtl.bundle<>
      %0 = firrtl.subfield %io[i] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %0, %i : !firrtl.uint<32>
      %1 = firrtl.subfield %io[o] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %o, %1 : !firrtl.uint<32>
      %2 = firrtl.subfield %io[o] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      %3 = firrtl.subfield %io[i] : !firrtl.bundle<i flip: uint<32>, o: uint<32>>
      firrtl.connect %2, %3 : !firrtl.uint<32>
    }
  }
}
