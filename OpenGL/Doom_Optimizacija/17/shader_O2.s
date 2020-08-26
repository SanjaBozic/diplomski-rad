	.text
	.section	.AMDGPU.config
	.long	45608
	.long	262
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
	; mask branch BB0_8
	s_cbranch_execz BB0_8
BB0_5:                                  ; %if11500
	buffer_load_format_xyzw v[2:5], v9, s[20:23], 0 idxen
	s_movk_i32 s11, 0x8000
	s_load_dwordx4 s[0:3], s[10:11], 0x200
	s_waitcnt lgkmcnt(0)
	s_buffer_load_dword s8, s[0:3], 0x0
	s_buffer_load_dwordx4 s[4:7], s[0:3], 0x50
	s_buffer_load_dwordx4 s[12:15], s[0:3], 0x60
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_f32_e64 s8, s8, 0
	s_and_b32 vcc_lo, exec_lo, s8
	s_waitcnt vmcnt(0)
	v_fma_f32 v2, v2, s4, s12
	v_fma_f32 v3, v3, s5, s13
	v_fma_f32 v1, v4, s6, s14
	v_fma_f32 v0, v5, s7, s15
	s_cbranch_vccnz BB0_7
; %bb.6:                                ; %if1
	buffer_load_format_xyzw v[4:7], v11, s[28:31], 0 idxen
	s_mov_b32 s8, 0x437f0000
	buffer_load_format_xyzw v[38:41], v12, s[32:35], 0 idxen
	buffer_load_format_xyzw v[11:14], v10, s[24:27], 0 idxen
	s_load_dwordx4 s[4:7], s[10:11], 0x210
	s_mov_b32 s9, 0x3b810204
	s_mov_b32 s10, 0x3c888889
	s_waitcnt vmcnt(2)
	v_mul_f32_e32 v4, s8, v4
	v_mul_f32_e32 v5, s8, v5
	v_mul_f32_e32 v7, s8, v7
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v31, 0x417f199a, v14
	v_cvt_u32_f32_e32 v4, v4
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v7, v7
	v_floor_f32_e32 v31, v31
	v_mul_f32_e32 v35, 0xc1800000, v31
	v_mul_f32_e32 v36, 0x3cb60b61, v31
	v_mul_lo_u32 v4, v4, 48
	v_mul_lo_u32 v5, v5, 48
	v_mul_lo_u32 v39, v7, 48
	v_or_b32_e32 v10, 4, v4
	s_waitcnt lgkmcnt(0)
	buffer_load_dwordx2 v[8:9], v4, s[4:7], 0 offen
	buffer_load_dwordx4 v[19:22], v4, s[4:7], 0 offen offset:28
	buffer_load_dword v33, v4, s[4:7], 0 offen offset:44
	buffer_load_dwordx4 v[15:18], v4, s[4:7], 0 offen offset:12
	buffer_load_dword v10, v10, s[4:7], 0 offen offset:4
	buffer_load_dwordx2 v[12:13], v5, s[4:7], 0 offen
	buffer_load_dwordx4 v[23:26], v5, s[4:7], 0 offen offset:12
	buffer_load_dwordx4 v[27:30], v5, s[4:7], 0 offen offset:28
	buffer_load_dword v34, v5, s[4:7], 0 offen offset:44
	v_mul_f32_e32 v4, s8, v6
	v_mul_f32_e32 v6, 0x3fff199a, v41
	s_mov_b32 s8, 0x437f199a
	v_or_b32_e32 v11, 4, v5
	v_cvt_u32_f32_e32 v4, v4
	v_floor_f32_e32 v6, v6
	v_fmac_f32_e32 v35, s8, v14
	v_mul_f32_e32 v6, 0xc3000000, v6
	v_fmac_f32_e32 v6, s8, v41
	v_mul_f32_e32 v38, s9, v6
	v_mul_lo_u32 v37, v4, 48
	v_fma_f32 v4, s9, v6, v36
	v_fmac_f32_e32 v4, s10, v35
	v_sub_f32_e32 v14, 1.0, v4
	buffer_load_dwordx2 v[31:32], v37, s[4:7], 0 offen
	buffer_load_dwordx4 v[4:7], v37, s[4:7], 0 offen offset:12
	v_or_b32_e32 v40, 4, v37
	buffer_load_dword v41, v11, s[4:7], 0 offen offset:4
	s_waitcnt vmcnt(11)
	v_mul_f32_e32 v42, v8, v14
	s_waitcnt vmcnt(10)
	v_mul_f32_e32 v48, v19, v14
	v_mul_f32_e32 v43, v9, v14
	s_waitcnt vmcnt(8)
	v_mul_f32_e32 v47, v18, v14
	s_waitcnt vmcnt(7)
	v_mul_f32_e32 v51, v10, v14
	v_mul_f32_e32 v49, v20, v14
	v_mul_f32_e32 v50, v21, v14
	buffer_load_dwordx4 v[8:11], v37, s[4:7], 0 offen offset:28
	v_mul_f32_e32 v44, v15, v14
	v_mul_f32_e32 v45, v16, v14
	v_mul_f32_e32 v46, v17, v14
	s_waitcnt vmcnt(6)
	v_fmac_f32_e32 v47, v26, v38
	buffer_load_dwordx2 v[20:21], v39, s[4:7], 0 offen
	buffer_load_dwordx4 v[15:18], v39, s[4:7], 0 offen offset:12
	s_waitcnt vmcnt(7)
	v_fmac_f32_e32 v48, v27, v38
	v_fmac_f32_e32 v49, v28, v38
	v_fmac_f32_e32 v50, v29, v38
	buffer_load_dwordx4 v[26:29], v39, s[4:7], 0 offen offset:28
	v_fmac_f32_e32 v44, v23, v38
	buffer_load_dword v37, v37, s[4:7], 0 offen offset:44
	buffer_load_dword v40, v40, s[4:7], 0 offen offset:4
	v_or_b32_e32 v23, 4, v39
	v_mul_f32_e32 v22, v22, v14
	v_mul_f32_e32 v33, v33, v14
	v_fmac_f32_e32 v45, v24, v38
	v_fmac_f32_e32 v43, v13, v38
	buffer_load_dword v14, v23, s[4:7], 0 offen offset:4
	buffer_load_dword v24, v39, s[4:7], 0 offen offset:44
	v_fmac_f32_e32 v46, v25, v38
	v_fmac_f32_e32 v42, v12, v38
	v_mul_f32_e32 v19, s10, v35
	v_fmac_f32_e32 v22, v30, v38
	s_waitcnt vmcnt(11)
	v_fmac_f32_e32 v33, v34, v38
	s_waitcnt vmcnt(10)
	v_fmac_f32_e32 v43, v32, v36
	s_waitcnt vmcnt(9)
	v_fmac_f32_e32 v46, v6, v36
	v_fmac_f32_e32 v42, v31, v36
	s_waitcnt vmcnt(8)
	v_fmac_f32_e32 v51, v41, v38
	v_fmac_f32_e32 v45, v5, v36
	v_fmac_f32_e32 v44, v4, v36
	v_fmac_f32_e32 v47, v7, v36
	s_waitcnt vmcnt(7)
	v_fmac_f32_e32 v50, v10, v36
	v_fmac_f32_e32 v49, v9, v36
	v_fmac_f32_e32 v22, v11, v36
	v_fmac_f32_e32 v48, v8, v36
	s_waitcnt vmcnt(6)
	v_fmac_f32_e32 v43, v21, v19
	s_waitcnt vmcnt(5)
	v_fmac_f32_e32 v46, v17, v19
	v_fmac_f32_e32 v42, v20, v19
	v_fmac_f32_e32 v45, v16, v19
	v_fmac_f32_e32 v47, v18, v19
	s_waitcnt vmcnt(4)
	v_fmac_f32_e32 v50, v28, v19
	v_mul_f32_e32 v4, v3, v43
	v_mul_f32_e32 v7, v3, v46
	s_waitcnt vmcnt(2)
	v_fmac_f32_e32 v51, v40, v36
	v_fmac_f32_e32 v49, v27, v19
	v_mul_f32_e32 v11, v3, v50
	v_fmac_f32_e32 v33, v37, v36
	v_fmac_f32_e32 v7, v2, v45
	v_fmac_f32_e32 v22, v29, v19
	s_waitcnt vmcnt(1)
	v_fmac_f32_e32 v51, v14, v19
	v_fmac_f32_e32 v4, v2, v42
	v_fmac_f32_e32 v11, v2, v49
	v_fmac_f32_e32 v44, v15, v19
	v_fmac_f32_e32 v48, v26, v19
	v_fmac_f32_e32 v7, v1, v47
	v_fmac_f32_e32 v4, v1, v51
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v33, v24, v19
	v_fmac_f32_e32 v11, v1, v22
	v_fmac_f32_e32 v7, v0, v48
	v_fmac_f32_e32 v4, v0, v44
	v_fmac_f32_e32 v11, v0, v33
	v_mov_b32_e32 v0, 1.0
	v_mov_b32_e32 v3, v7
	v_mov_b32_e32 v2, v4
	v_mov_b32_e32 v1, v11
BB0_7:                                  ; %endif1
	s_buffer_load_dwordx4 s[4:7], s[0:3], 0x10
	s_buffer_load_dwordx4 s[8:11], s[0:3], 0x20
	s_buffer_load_dwordx4 s[12:15], s[0:3], 0x30
	s_buffer_load_dwordx4 s[0:3], s[0:3], 0x40
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v4, s5, v3
	v_mul_f32_e32 v5, s9, v3
	v_mul_f32_e32 v6, s13, v3
	v_mul_f32_e32 v3, s1, v3
	v_fmac_f32_e32 v4, s4, v2
	v_fmac_f32_e32 v5, s8, v2
	v_fmac_f32_e32 v6, s12, v2
	v_fmac_f32_e32 v3, s0, v2
	v_fmac_f32_e32 v4, s6, v1
	v_fmac_f32_e32 v5, s10, v1
	v_fmac_f32_e32 v6, s14, v1
	v_fmac_f32_e32 v3, s2, v1
	v_fmac_f32_e32 v4, s7, v0
	v_fmac_f32_e32 v5, s11, v0
	v_fmac_f32_e32 v6, s15, v0
	v_fmac_f32_e32 v3, s3, v0
	exp pos0 v4, v5, v6, v3 done vm
BB0_8:                                  ; %endif6002
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 1056
; NumSgprs: 38
; NumVgprs: 52
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 6
; NumSGPRsForWavesPerEU: 38
; NumVGPRsForWavesPerEU: 52
; Occupancy: 18
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 0
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn----gfx1010"
