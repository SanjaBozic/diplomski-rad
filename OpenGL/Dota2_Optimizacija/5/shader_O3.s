	.text
	.section	.AMDGPU.config
	.long	45608
	.long	129
	.long	165608
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 exec_lo, -1
	s_and_b32 s0, s3, 0xf000000
                                        ; implicit-def: $vcc_hi
	s_cmp_lg_u32 s0, 0
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	s_lshr_b32 s0, s2, 10
	s_bfe_u32 s1, s2, 0x9000c
	s_and_b32 s0, s0, 0x1ff000
	s_or_b32 m0, s0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_mbcnt_lo_u32_b32_e64 v1, -1, 0
	s_bfe_u32 s0, s3, 0x80008
	v_mbcnt_hi_u32_b32_e64 v1, -1, v1
	v_cmp_gt_u32_e32 vcc_lo, s0, v1
	s_and_saveexec_b32 s0, vcc_lo
	; mask branch BB0_4
	s_cbranch_execz BB0_4
BB0_3:                                  ; %if6001
	exp prim v0, off, off, off done
BB0_4:                                  ; %endif6001
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_and_b32 s0, s3, 0xff
	v_cmp_gt_u32_e32 vcc_lo, s0, v1
	s_and_saveexec_b32 s0, vcc_lo
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	v_mov_b32_e32 v0, s10
	v_cmp_gt_u32_e32 vcc_lo, 2, v5
	v_mov_b32_e32 v1, s11
	v_mov_b32_e32 v2, 1.0
	v_mov_b32_e32 v3, s12
	v_cndmask_b32_e32 v0, s11, v0, vcc_lo
	v_cmp_eq_u32_e32 vcc_lo, 1, v5
	v_cvt_f32_i32_sdwa v0, sext(v0) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0
	v_cndmask_b32_e32 v1, s10, v1, vcc_lo
	v_cvt_f32_i32_sdwa v1, sext(v1) dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
	exp pos0 v0, v1, v3, v2 done vm
	s_waitcnt expcnt(0)
	v_mov_b32_e32 v0, s13
	v_mov_b32_e32 v1, s14
	v_mov_b32_e32 v2, s15
	v_mov_b32_e32 v3, s16
	exp param0 v0, v1, v2, v3
BB0_6:                                  ; %endif6002
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 208
; NumSgprs: 19
; NumVgprs: 6
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 19
; NumVGPRsForWavesPerEU: 11
; Occupancy: 20
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 0
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn----gfx1010"
