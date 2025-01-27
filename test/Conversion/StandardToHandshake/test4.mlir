// NOTE: Assertions have been autogenerated by utils/update_mlir_test_checks.py
// RUN: circt-opt -lower-std-to-handshake %s | FileCheck %s
func @ops(f32, f32, i32, i32) -> (f32, i32) {
// CHECK:       module {

// CHECK-LABEL:   handshake.func @ops(
// CHECK-SAME:                        %[[VAL_0:.*]]: f32, %[[VAL_1:.*]]: f32, %[[VAL_2:.*]]: i32, %[[VAL_3:.*]]: i32, %[[VAL_4:.*]]: none, ...) -> (f32, i32, none) attributes {argNames = ["in0", "in1", "in2", "in3", "inCtrl"], resNames = ["out0", "out1", "outCtrl"]} {
// CHECK:           %[[VAL_5:.*]] = "handshake.merge"(%[[VAL_0]]) : (f32) -> f32
// CHECK:           %[[VAL_6:.*]]:3 = "handshake.fork"(%[[VAL_5]]) {control = false} : (f32) -> (f32, f32, f32)
// CHECK:           %[[VAL_7:.*]] = "handshake.merge"(%[[VAL_1]]) : (f32) -> f32
// CHECK:           %[[VAL_8:.*]]:3 = "handshake.fork"(%[[VAL_7]]) {control = false} : (f32) -> (f32, f32, f32)
// CHECK:           %[[VAL_9:.*]] = "handshake.merge"(%[[VAL_2]]) : (i32) -> i32
// CHECK:           %[[VAL_10:.*]]:10 = "handshake.fork"(%[[VAL_9]]) {control = false} : (i32) -> (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)
// CHECK:           %[[VAL_11:.*]] = "handshake.merge"(%[[VAL_3]]) : (i32) -> i32
// CHECK:           %[[VAL_12:.*]]:9 = "handshake.fork"(%[[VAL_11]]) {control = false} : (i32) -> (i32, i32, i32, i32, i32, i32, i32, i32, i32)
// CHECK:           %[[VAL_13:.*]] = arith.subf %[[VAL_6]]#2, %[[VAL_8]]#2 : f32
// CHECK:           %[[VAL_14:.*]] = arith.subi %[[VAL_10]]#9, %[[VAL_12]]#8 : i32
// CHECK:           %[[VAL_15:.*]] = arith.cmpi slt, %[[VAL_10]]#8, %[[VAL_14]] : i32
// CHECK:           %[[VAL_16:.*]] = arith.divsi %[[VAL_10]]#7, %[[VAL_12]]#7 : i32
// CHECK:           %[[VAL_17:.*]] = arith.divui %[[VAL_10]]#6, %[[VAL_12]]#6 : i32
// CHECK:           "handshake.sink"(%[[VAL_17]]) : (i32) -> ()
// CHECK:           %[[VAL_18:.*]] = arith.remsi %[[VAL_10]]#5, %[[VAL_12]]#5 : i32
// CHECK:           "handshake.sink"(%[[VAL_18]]) : (i32) -> ()
// CHECK:           %[[VAL_19:.*]] = arith.remui %[[VAL_10]]#4, %[[VAL_12]]#4 : i32
// CHECK:           "handshake.sink"(%[[VAL_19]]) : (i32) -> ()
// CHECK:           %[[VAL_20:.*]] = select %[[VAL_15]], %[[VAL_10]]#3, %[[VAL_12]]#3 : i32
// CHECK:           "handshake.sink"(%[[VAL_20]]) : (i32) -> ()
// CHECK:           %[[VAL_21:.*]] = arith.divf %[[VAL_6]]#1, %[[VAL_8]]#1 : f32
// CHECK:           "handshake.sink"(%[[VAL_21]]) : (f32) -> ()
// CHECK:           %[[VAL_22:.*]] = arith.remf %[[VAL_6]]#0, %[[VAL_8]]#0 : f32
// CHECK:           "handshake.sink"(%[[VAL_22]]) : (f32) -> ()
// CHECK:           %[[VAL_23:.*]] = arith.andi %[[VAL_10]]#2, %[[VAL_12]]#2 : i32
// CHECK:           "handshake.sink"(%[[VAL_23]]) : (i32) -> ()
// CHECK:           %[[VAL_24:.*]] = arith.ori %[[VAL_10]]#1, %[[VAL_12]]#1 : i32
// CHECK:           "handshake.sink"(%[[VAL_24]]) : (i32) -> ()
// CHECK:           %[[VAL_25:.*]] = arith.xori %[[VAL_10]]#0, %[[VAL_12]]#0 : i32
// CHECK:           "handshake.sink"(%[[VAL_25]]) : (i32) -> ()
// CHECK:           handshake.return %[[VAL_13]], %[[VAL_16]], %[[VAL_4]] : f32, i32, none
// CHECK:         }
// CHECK:       }

^bb0(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32):
  %0 = arith.subf %arg0, %arg1: f32
  %1 = arith.subi %arg2, %arg3: i32
  %2 = arith.cmpi slt, %arg2, %1 : i32
  %4 = arith.divsi %arg2, %arg3 : i32
  %5 = arith.divui %arg2, %arg3 : i32
  %6 = arith.remsi %arg2, %arg3 : i32
  %7 = arith.remui %arg2, %arg3 : i32
  %8 = select %2, %arg2, %arg3 : i32
  %9 = arith.divf %arg0, %arg1 : f32
  %10 = arith.remf %arg0, %arg1 : f32
  %11 = arith.andi %arg2, %arg3 : i32
  %12 = arith.ori %arg2, %arg3 : i32
  %13 = arith.xori %arg2, %arg3 : i32
  return %0, %4 : f32, i32
}
