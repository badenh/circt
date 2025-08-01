//===- Passes.h - Kanagawa pass entry points --------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef CIRCT_DIALECT_KANAGAWA_KANAGAWAPASSES_H
#define CIRCT_DIALECT_KANAGAWA_KANAGAWAPASSES_H

#include "circt/Dialect/DC/DCDialect.h"
#include "circt/Dialect/Pipeline/PipelineDialect.h"
#include "circt/Dialect/SSP/SSPDialect.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlow.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassRegistry.h"
#include <memory>
#include <optional>

namespace circt {
namespace kanagawa {

#define GEN_PASS_DECL_KANAGAWATUNNELING
#include "circt/Dialect/Kanagawa/KanagawaPasses.h.inc"

std::unique_ptr<mlir::Pass> createCallPrepPass();
std::unique_ptr<mlir::Pass> createContainerizePass();
std::unique_ptr<mlir::Pass>
createTunnelingPass(const KanagawaTunnelingOptions & = {});
std::unique_ptr<mlir::Pass> createPortrefLoweringPass();
std::unique_ptr<mlir::Pass> createCleanSelfdriversPass();
std::unique_ptr<mlir::Pass> createContainersToHWPass();
std::unique_ptr<mlir::Pass> createEliminateRedundantOpsPass();
std::unique_ptr<mlir::Pass> createArgifyBlocksPass();
std::unique_ptr<mlir::Pass> createReblockPass();
std::unique_ptr<mlir::Pass> createInlineSBlocksPass();
std::unique_ptr<mlir::Pass> createConvertCFToHandshakePass();
std::unique_ptr<mlir::Pass> createPrepareSchedulingPass();
std::unique_ptr<mlir::Pass> createConvertHandshakeToDCPass();
std::unique_ptr<mlir::Pass> createConvertMethodsToContainersPass();
std::unique_ptr<mlir::Pass> createAddOperatorLibraryPass();

/// Generate the code for registering passes.
#define GEN_PASS_REGISTRATION
#include "circt/Dialect/Kanagawa/KanagawaPasses.h.inc"

} // namespace kanagawa
} // namespace circt

#endif // CIRCT_DIALECT_KANAGAWA_KANAGAWAPASSES_H
