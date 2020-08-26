	.text
	.section	.AMDGPU.config
	.long	45608
	.long	257
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
	s_and_b32 s1, s3, 0xf000000
	s_mov_b32 s0, s10
                                        ; implicit-def: $vcc_hi
	s_cmp_lg_u32 s1, 0
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	s_lshr_b32 s1, s2, 10
	s_bfe_u32 s2, s2, 0x9000c
	s_and_b32 s1, s1, 0x1ff000
	s_or_b32 m0, s1, s2
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	s_bfe_u32 s1, s3, 0x80008
	v_mbcnt_lo_u32_b32_e64 v1, -1, 0
	v_cmp_gt_u32_e32 vcc_lo, s1, v1
	s_and_saveexec_b32 s1, vcc_lo
	; mask branch BB0_4
	s_cbranch_execz BB0_4
BB0_3:                                  ; %if6001
	exp prim v0, off, off, off done
BB0_4:                                  ; %endif6001
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s1
	s_and_b32 s1, s3, 0xff
	v_cmp_gt_u32_e32 vcc_lo, s1, v1
	s_and_saveexec_b32 s1, vcc_lo
	; mask branch BB0_8
	s_cbranch_execz BB0_8
BB0_5:                                  ; %if11500
	buffer_load_format_xyzw v[0:3], v10, s[24:27], 0 idxen
	s_and_b32 s1, s12, 1
	s_cmp_eq_u32 s1, 0
	s_cbranch_scc1 BB0_7
; %bb.6:                                ; %if6502
	s_waitcnt vmcnt(0)
	v_max_f32_e64 v0, v0, v0 clamp
	v_max_f32_e64 v1, v1, v1 clamp
	v_max_f32_e64 v2, v2, v2 clamp
	v_max_f32_e64 v3, v3, v3 clamp
BB0_7:                                  ; %endif6502
	buffer_load_format_xyzw v[4:7], v9, s[20:23], 0 idxen
	buffer_load_format_x v8, v11, s[28:31], 0 idxen
	s_mov_b32 s3, 0x31016fac
	s_mov_b32 s2, 64
	s_mov_b32 s1, 0x8000
	s_buffer_load_dwordx4 s[4:7], s[0:3], 0x0
	s_buffer_load_dwordx4 s[8:11], s[0:3], 0x10
	s_buffer_load_dwordx4 s[12:15], s[0:3], 0x20
	s_buffer_load_dwordx4 s[0:3], s[0:3], 0x30
	s_waitcnt vmcnt(1) lgkmcnt(0)
	v_mul_f32_e32 v9, s4, v4
	v_mul_f32_e32 v10, s5, v4
	v_mul_f32_e32 v11, s6, v4
	v_mul_f32_e32 v4, s7, v4
	v_fmac_f32_e32 v9, s8, v5
	v_fmac_f32_e32 v10, s9, v5
	v_fmac_f32_e32 v11, s10, v5
	v_fmac_f32_e32 v4, s11, v5
	v_fmac_f32_e32 v9, s12, v6
	v_fmac_f32_e32 v10, s13, v6
	v_fmac_f32_e32 v11, s14, v6
	v_fmac_f32_e32 v4, s15, v6
	v_fmac_f32_e32 v9, s0, v7
	v_fmac_f32_e32 v10, s1, v7
	v_fmac_f32_e32 v11, s2, v7
	v_fmac_f32_e32 v4, s3, v7
	exp pos0 v9, v10, v11, v4 vm
	s_waitcnt vmcnt(0)
	exp pos1 v8, off, off, off done
	exp param0 v0, v1, v2, v3
BB0_8:                                  ; %endif6002
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 340
; NumSgprs: 34
; NumVgprs: 12
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 34
; NumVGPRsForWavesPerEU: 12
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
