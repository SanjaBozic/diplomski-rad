	.text
	.section	.AMDGPU.config
	.long	45608
	.long	260
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
	v_mbcnt_lo_u32_b32_e64 v1, -1, 0
	s_bfe_u32 s1, s3, 0x80008
	v_mbcnt_hi_u32_b32_e64 v1, -1, v1
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
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	buffer_load_format_x v0, v11, s[28:31], 0 idxen
	s_mov_b32 s3, 0x31016fac
	s_movk_i32 s2, 0x280
	s_mov_b32 s1, 0x8000
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v0, 0x3e800000, v0
	v_trunc_f32_e32 v0, v0
	v_max_f32_e32 v0, 0, v0
	v_min_f32_e32 v0, 0x40e00000, v0
	v_cvt_i32_f32_e32 v4, v0
	v_lshlrev_b32_e32 v5, 6, v4
	buffer_load_format_xyzw v[0:3], v9, s[20:23], 0 idxen
	v_lshlrev_b32_e32 v4, 4, v4
	v_or_b32_e32 v6, 20, v5
	buffer_load_dwordx3 v[30:32], v5, s[0:3], 0 offen offset:12
	v_or_b32_e32 v7, 4, v5
	buffer_load_dword v22, v6, s[0:3], 0 offen offset:4
	buffer_load_dwordx3 v[27:29], v5, s[0:3], 0 offen offset:28
	buffer_load_dwordx2 v[33:34], v5, s[0:3], 0 offen
	v_or_b32_e32 v6, 36, v5
	buffer_load_dword v23, v7, s[0:3], 0 offen offset:4
	v_or_b32_e32 v7, 52, v5
	buffer_load_dword v24, v6, s[0:3], 0 offen offset:4
	buffer_load_dwordx3 v[15:17], v5, s[0:3], 0 offen offset:44
	buffer_load_dword v14, v7, s[0:3], 0 offen offset:4
	buffer_load_dword v26, v5, s[0:3], 0 offen offset:60
	buffer_load_format_xy v[19:20], v10, s[24:27], 0 idxen
	buffer_load_dwordx4 v[4:7], v4, s[0:3], 0 offen offset:512
	s_waitcnt vmcnt(10)
	v_mul_f32_e32 v10, v31, v1
	v_mul_f32_e32 v12, v32, v1
	s_waitcnt vmcnt(9)
	v_mul_f32_e32 v13, v22, v1
	s_waitcnt vmcnt(8)
	v_mul_f32_e32 v1, v27, v1
	s_waitcnt vmcnt(7)
	v_fmac_f32_e32 v10, v33, v0
	v_fmac_f32_e32 v12, v34, v0
	s_waitcnt vmcnt(6)
	v_fmac_f32_e32 v13, v23, v0
	v_fmac_f32_e32 v1, v30, v0
	v_fmac_f32_e32 v10, v28, v2
	v_fmac_f32_e32 v12, v29, v2
	s_waitcnt vmcnt(5)
	v_fmac_f32_e32 v13, v24, v2
	s_waitcnt vmcnt(4)
	v_fmac_f32_e32 v1, v15, v2
	v_fmac_f32_e32 v10, v16, v3
	v_fmac_f32_e32 v12, v17, v3
	s_waitcnt vmcnt(0)
	v_fma_f32 v0, v19, v6, v4
	v_fmac_f32_e32 v13, v14, v3
	v_fmac_f32_e32 v1, v26, v3
	exp pos0 v10, v12, v13, v1 done vm
	s_waitcnt expcnt(0)
	v_fma_f32 v1, v20, v7, v5
	exp param0 v0, v1, v0, v0
BB0_6:                                  ; %endif6002
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 440
; NumSgprs: 34
; NumVgprs: 35
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 4
; NumSGPRsForWavesPerEU: 34
; NumVGPRsForWavesPerEU: 35
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
