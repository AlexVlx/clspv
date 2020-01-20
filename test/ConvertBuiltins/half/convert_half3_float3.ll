
; RUN: clspv-opt -ReplaceOpenCLBuiltin %s -o %t.ll
; RUN: FileCheck %s < %t.ll

target datalayout = "e-p:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir-unknown-unknown"

; CHECK: [[conv:%[a-zA-Z0-9_.]+]] = fptrunc <3 x float> %x to <3 x half>
; CHECK: ret <3 x half> [[conv]]

define <3 x half>@foo(<3 x float> %x) {
entry:
  %call = call <3 x half> @_Z13convert_half3Dv3_f(<3 x float> %x)
  ret <3 x half> %call
}

declare <3 x half> @_Z13convert_half3Dv3_f(<3 x float>)
