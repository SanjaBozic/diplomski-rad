	.text
	.section	.AMDGPU.config
	.long	45608
	.long	389
	.long	165608
	.long	8192
	.long	4
	.long	25
	.long	8
	.long	18
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s44, SCRATCH_RSRC_DWORD0
	s_mov_b32 s45, SCRATCH_RSRC_DWORD1
	s_mov_b32 s46, -1
	s_mov_b32 s47, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s12, s32
	s_mov_b32 s13, s33
	s_mov_b32 s14, s34
	s_mov_b32 s15, s35
	s_mov_b32 s16, s28
	s_mov_b32 s17, s29
	s_mov_b32 s18, s30
	s_mov_b32 s19, s31
	s_mov_b32 s36, s24
	s_mov_b32 s37, s25
	s_mov_b32 s38, s26
	s_mov_b32 s39, s27
	s_mov_b32 s40, s20
	s_mov_b32 s41, s21
	s_mov_b32 s42, s22
	s_mov_b32 s43, s23
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v12, off, s[44:47], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v11, off, s[44:47], s5 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[44:47], s5 offset:12 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[44:47], s5 offset:16 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[44:47], s5 offset:20 ; 4-byte Folded Spill
	v_writelane_b32 v47, s10, 0
	v_writelane_b32 v47, s3, 1
	v_writelane_b32 v47, s2, 2
	v_writelane_b32 v47, s12, 3
	v_writelane_b32 v47, s13, 4
	v_writelane_b32 v47, s14, 5
	v_writelane_b32 v47, s15, 6
	v_writelane_b32 v47, s16, 7
	v_writelane_b32 v47, s17, 8
	v_writelane_b32 v47, s18, 9
	v_writelane_b32 v47, s19, 10
	v_writelane_b32 v47, s36, 11
	v_writelane_b32 v47, s37, 12
	v_writelane_b32 v47, s38, 13
	v_writelane_b32 v47, s39, 14
	v_writelane_b32 v47, s40, 15
	v_writelane_b32 v47, s41, 16
	v_writelane_b32 v47, s42, 17
	v_writelane_b32 v47, s43, 18
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v47, 2
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v47, 1
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_mbcnt_hi_u32_b32_e64 v0, s3, v0
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[44:47], s5 offset:24 ; 4-byte Folded Spill
	v_writelane_b32 v47, s2, 19
	s_mov_b32 exec_lo, s1
	; mask branch BB0_4
	s_cbranch_execz BB0_4
BB0_3:                                  ; %if6001
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v0, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v1, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
	buffer_load_dword v3, off, s[44:47], s5 offset:20 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v47, 19
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v47, 1
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[44:47], s5 offset:24 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v47, s3, 20
	s_mov_b32 exec_lo, s1
	; mask branch BB0_7
	s_cbranch_execz BB0_7
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[44:47], s5 offset:16 ; 4-byte Folded Reload
	v_readlane_b32 s8, v47, 15
	v_readlane_b32 s9, v47, 16
	v_readlane_b32 s10, v47, 17
	v_readlane_b32 s11, v47, 18
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[1:4], v0, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v1
	v_mov_b32_e32 v6, v2
	v_mov_b32_e32 v7, v3
                                        ; kill: def $vgpr4 killed $vgpr4 killed $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
	s_movk_i32 s0, 0x8000
	v_readlane_b32 s1, v47, 0
	s_mov_b32 s2, s1
	s_mov_b32 s3, s0
	s_load_dwordx4 s[12:15], s[2:3], 0x200
	s_waitcnt lgkmcnt(0)
	s_buffer_load_dword s0, s[12:15], 0x50
	s_buffer_load_dword s4, s[12:15], 0x54
	s_buffer_load_dword s6, s[12:15], 0x58
	s_buffer_load_dword s7, s[12:15], 0x5c
	s_buffer_load_dword s16, s[12:15], 0x60
	s_buffer_load_dword s17, s[12:15], 0x64
	s_buffer_load_dword s18, s[12:15], 0x68
	s_buffer_load_dword s19, s[12:15], 0x6c
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v1, s16
	v_fmac_f32_e32 v1, s0, v5
	v_mov_b32_e32 v2, s17
	v_fmac_f32_e32 v2, s4, v6
	v_mov_b32_e32 v3, s18
	v_fmac_f32_e32 v3, s6, v7
	v_mov_b32_e32 v5, s19
	v_fmac_f32_e32 v5, s7, v4
	s_buffer_load_dword s0, s[12:15], 0x0
	s_mov_b32 s4, 0
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_f32_e64 s0, s4, s0
	s_and_b32 vcc_lo, exec_lo, s0
	v_mov_b32_e32 v4, v1
	v_mov_b32_e32 v6, v2
	v_mov_b32_e32 v7, v3
	v_mov_b32_e32 v8, v5
	v_writelane_b32 v47, s12, 21
	v_writelane_b32 v47, s13, 22
	v_writelane_b32 v47, s14, 23
	v_writelane_b32 v47, s15, 24
	buffer_store_dword v1, off, s[44:47], s5 offset:28 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[44:47], s5 offset:32 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[44:47], s5 offset:36 ; 4-byte Folded Spill
	buffer_store_dword v5, off, s[44:47], s5 offset:40 ; 4-byte Folded Spill
	buffer_store_dword v4, off, s[44:47], s5 offset:44 ; 4-byte Folded Spill
	buffer_store_dword v6, off, s[44:47], s5 offset:48 ; 4-byte Folded Spill
	buffer_store_dword v7, off, s[44:47], s5 offset:52 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[44:47], s5 offset:56 ; 4-byte Folded Spill
	s_cbranch_vccnz BB0_8
; %bb.6:                                ; %if1
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[44:47], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s8, v47, 3
	v_readlane_b32 s9, v47, 4
	v_readlane_b32 s10, v47, 5
	v_readlane_b32 s11, v47, 6
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[1:4], v0, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
                                        ; kill: def $vgpr4 killed $vgpr4 killed $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
	buffer_load_dword v1, off, s[44:47], s5 offset:12 ; 4-byte Folded Reload
	v_readlane_b32 s12, v47, 11
	v_readlane_b32 s13, v47, 12
	v_readlane_b32 s14, v47, 13
	v_readlane_b32 s15, v47, 14
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[5:8], v1, s[12:15], s0 idxen
	s_waitcnt vmcnt(0)
                                        ; kill: def $vgpr8 killed $vgpr8 killed $vgpr5_vgpr6_vgpr7_vgpr8 killed $exec
	buffer_load_dword v2, off, s[44:47], s5 offset:8 ; 4-byte Folded Reload
	v_readlane_b32 s16, v47, 7
	v_readlane_b32 s17, v47, 8
	v_readlane_b32 s18, v47, 9
	v_readlane_b32 s19, v47, 10
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[9:12], v2, s[16:19], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v3, v9
	v_mov_b32_e32 v5, v10
	v_mov_b32_e32 v6, v11
                                        ; kill: def $vgpr12 killed $vgpr12 killed $vgpr9_vgpr10_vgpr11_vgpr12 killed $exec
	s_mov_b32 s1, 0x3fff199a
	v_mul_f32_e32 v7, s1, v4
	v_floor_f32_e32 v7, v7
	s_mov_b32 s1, 0xc3000000
	v_mul_f32_e32 v7, s1, v7
	s_mov_b32 s1, 0x437f199a
	v_fmac_f32_e32 v7, s1, v4
	s_mov_b32 s2, 0x417f199a
	v_mul_f32_e32 v4, s2, v8
	v_floor_f32_e32 v4, v4
	s_mov_b32 s2, 0xc1800000
	v_mul_f32_e32 v9, s2, v4
	v_fmac_f32_e32 v9, s1, v8
	s_mov_b32 s1, 0x3b810204
	v_mul_f32_e32 v8, s1, v7
	s_mov_b32 s2, 0x3cb60b61
	v_mul_f32_e32 v4, s2, v4
	s_mov_b32 s2, 0x3c888889
	v_mul_f32_e32 v10, s2, v9
	v_mov_b32_e32 v11, v4
	v_fmac_f32_e32 v11, s1, v7
	v_fmac_f32_e32 v11, s2, v9
	s_mov_b32 s1, 1.0
	v_sub_f32_e32 v7, s1, v11
	s_mov_b32 s2, 0x437f0000
	v_mul_f32_e32 v3, s2, v3
	v_mul_f32_e32 v5, s2, v5
	v_mul_f32_e32 v6, s2, v6
	v_mul_f32_e32 v9, s2, v12
	v_cvt_u32_f32_e32 v3, v3
	v_cvt_u32_f32_e32 v5, v5
	v_cvt_u32_f32_e32 v6, v6
	v_cvt_u32_f32_e32 v9, v9
	s_mov_b32 s2, 48
                                        ; implicit-def: $sgpr3
	v_mul_lo_u32 v3, v3, s2
	s_movk_i32 s3, 0x8000
	v_readlane_b32 s4, v47, 0
	s_mov_b32 s6, s4
	s_mov_b32 s7, s3
	s_load_dwordx4 s[20:23], s[6:7], 0x210
	s_mov_b32 s3, 4
	v_mov_b32_e32 v11, s3
	v_or_b32_e32 v11, v3, v11
	s_waitcnt lgkmcnt(0)
	buffer_load_dword v11, v11, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v12, v3
	buffer_load_dword v12, v12, s[20:23], s0 offen
	v_mov_b32_e32 v13, v3
	buffer_load_dword v13, v13, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v14, v3
	buffer_load_dword v14, v14, s[20:23], s0 offen offset:12
	v_mov_b32_e32 v15, v3
	buffer_load_dword v15, v15, s[20:23], s0 offen offset:16
	v_mov_b32_e32 v16, v3
	buffer_load_dword v16, v16, s[20:23], s0 offen offset:20
	v_mov_b32_e32 v17, v3
	buffer_load_dword v17, v17, s[20:23], s0 offen offset:24
	v_mov_b32_e32 v18, v3
	buffer_load_dword v18, v18, s[20:23], s0 offen offset:28
	v_mov_b32_e32 v19, v3
	buffer_load_dword v19, v19, s[20:23], s0 offen offset:32
	v_mov_b32_e32 v20, v3
	buffer_load_dword v20, v20, s[20:23], s0 offen offset:36
	v_mov_b32_e32 v21, v3
	buffer_load_dword v21, v21, s[20:23], s0 offen offset:40
	buffer_load_dword v3, v3, s[20:23], s0 offen offset:44
	s_waitcnt vmcnt(10)
	v_mul_f32_e32 v12, v12, v7
	s_waitcnt vmcnt(9)
	v_mul_f32_e32 v13, v13, v7
	v_mul_f32_e32 v11, v11, v7
	s_waitcnt vmcnt(8)
	v_mul_f32_e32 v14, v14, v7
                                        ; implicit-def: $sgpr24
	v_mul_lo_u32 v5, v5, s2
	v_mov_b32_e32 v22, s3
	v_or_b32_e32 v22, v5, v22
	buffer_load_dword v22, v22, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v23, v5
	buffer_load_dword v23, v23, s[20:23], s0 offen
	v_mov_b32_e32 v24, v5
	buffer_load_dword v24, v24, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v25, v5
	buffer_load_dword v25, v25, s[20:23], s0 offen offset:12
	v_mov_b32_e32 v26, v5
	buffer_load_dword v26, v26, s[20:23], s0 offen offset:16
	v_mov_b32_e32 v27, v5
	buffer_load_dword v27, v27, s[20:23], s0 offen offset:20
	v_mov_b32_e32 v28, v5
	buffer_load_dword v28, v28, s[20:23], s0 offen offset:24
	v_mov_b32_e32 v29, v5
	buffer_load_dword v29, v29, s[20:23], s0 offen offset:28
	v_mov_b32_e32 v30, v5
	buffer_load_dword v30, v30, s[20:23], s0 offen offset:32
	v_mov_b32_e32 v31, v5
	buffer_load_dword v31, v31, s[20:23], s0 offen offset:36
	v_mov_b32_e32 v32, v5
	buffer_load_dword v32, v32, s[20:23], s0 offen offset:40
	buffer_load_dword v5, v5, s[20:23], s0 offen offset:44
	s_waitcnt vmcnt(10)
	v_fmac_f32_e32 v12, v23, v8
	s_waitcnt vmcnt(9)
	v_fmac_f32_e32 v13, v24, v8
	v_fmac_f32_e32 v11, v22, v8
	s_waitcnt vmcnt(8)
	v_fmac_f32_e32 v14, v25, v8
                                        ; implicit-def: $sgpr24
	v_mul_lo_u32 v6, v6, s2
	v_mov_b32_e32 v22, s3
	v_or_b32_e32 v22, v6, v22
	buffer_load_dword v22, v22, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v23, v6
	buffer_load_dword v23, v23, s[20:23], s0 offen
	v_mov_b32_e32 v24, v6
	buffer_load_dword v24, v24, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v25, v6
	buffer_load_dword v25, v25, s[20:23], s0 offen offset:12
	v_mov_b32_e32 v33, v6
	buffer_load_dword v33, v33, s[20:23], s0 offen offset:16
	v_mov_b32_e32 v34, v6
	buffer_load_dword v34, v34, s[20:23], s0 offen offset:20
	v_mov_b32_e32 v35, v6
	buffer_load_dword v35, v35, s[20:23], s0 offen offset:24
	v_mov_b32_e32 v36, v6
	buffer_load_dword v36, v36, s[20:23], s0 offen offset:28
	v_mov_b32_e32 v37, v6
	buffer_load_dword v37, v37, s[20:23], s0 offen offset:32
	v_mov_b32_e32 v38, v6
	buffer_load_dword v38, v38, s[20:23], s0 offen offset:36
	v_mov_b32_e32 v39, v6
	buffer_load_dword v39, v39, s[20:23], s0 offen offset:40
	buffer_load_dword v6, v6, s[20:23], s0 offen offset:44
	s_waitcnt vmcnt(10)
	v_fmac_f32_e32 v12, v23, v4
	s_waitcnt vmcnt(9)
	v_fmac_f32_e32 v13, v24, v4
	v_fmac_f32_e32 v11, v22, v4
	s_waitcnt vmcnt(8)
	v_fmac_f32_e32 v14, v25, v4
                                        ; implicit-def: $sgpr24
	v_mul_lo_u32 v9, v9, s2
	v_mov_b32_e32 v22, s3
	v_or_b32_e32 v22, v9, v22
	buffer_load_dword v22, v22, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v23, v9
	buffer_load_dword v23, v23, s[20:23], s0 offen
	v_mov_b32_e32 v24, v9
	buffer_load_dword v24, v24, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v25, v9
	buffer_load_dword v25, v25, s[20:23], s0 offen offset:12
	v_mov_b32_e32 v40, v9
	buffer_load_dword v40, v40, s[20:23], s0 offen offset:16
	v_mov_b32_e32 v41, v9
	buffer_load_dword v41, v41, s[20:23], s0 offen offset:20
	v_mov_b32_e32 v42, v9
	buffer_load_dword v42, v42, s[20:23], s0 offen offset:24
	v_mov_b32_e32 v43, v9
	buffer_load_dword v43, v43, s[20:23], s0 offen offset:28
	v_mov_b32_e32 v44, v9
	buffer_load_dword v44, v44, s[20:23], s0 offen offset:32
	v_mov_b32_e32 v45, v9
	buffer_load_dword v45, v45, s[20:23], s0 offen offset:36
	v_mov_b32_e32 v46, v9
	buffer_load_dword v46, v46, s[20:23], s0 offen offset:40
	buffer_load_dword v9, v9, s[20:23], s0 offen offset:44
	s_waitcnt vmcnt(10)
	v_fmac_f32_e32 v12, v23, v10
	s_waitcnt vmcnt(9)
	v_fmac_f32_e32 v13, v24, v10
	v_fmac_f32_e32 v11, v22, v10
	s_waitcnt vmcnt(8)
	v_fmac_f32_e32 v14, v25, v10
	v_mul_f32_e32 v15, v15, v7
	v_mul_f32_e32 v16, v16, v7
	v_mul_f32_e32 v17, v17, v7
	v_mul_f32_e32 v18, v18, v7
	v_fmac_f32_e32 v15, v26, v8
	v_fmac_f32_e32 v16, v27, v8
	v_fmac_f32_e32 v17, v28, v8
	v_fmac_f32_e32 v18, v29, v8
	v_fmac_f32_e32 v15, v33, v4
	v_fmac_f32_e32 v16, v34, v4
	v_fmac_f32_e32 v17, v35, v4
	v_fmac_f32_e32 v18, v36, v4
	s_waitcnt vmcnt(7)
	v_fmac_f32_e32 v15, v40, v10
	s_waitcnt vmcnt(6)
	v_fmac_f32_e32 v16, v41, v10
	s_waitcnt vmcnt(5)
	v_fmac_f32_e32 v17, v42, v10
	s_waitcnt vmcnt(4)
	v_fmac_f32_e32 v18, v43, v10
	v_mul_f32_e32 v19, v19, v7
	v_mul_f32_e32 v20, v20, v7
	v_mul_f32_e32 v21, v21, v7
	v_mul_f32_e32 v3, v3, v7
	v_fmac_f32_e32 v19, v30, v8
	v_fmac_f32_e32 v20, v31, v8
	v_fmac_f32_e32 v21, v32, v8
	v_fmac_f32_e32 v3, v5, v8
	v_fmac_f32_e32 v19, v37, v4
	v_fmac_f32_e32 v20, v38, v4
	v_fmac_f32_e32 v21, v39, v4
	v_fmac_f32_e32 v3, v6, v4
	s_waitcnt vmcnt(3)
	v_fmac_f32_e32 v19, v44, v10
	s_waitcnt vmcnt(2)
	v_fmac_f32_e32 v20, v45, v10
	s_waitcnt vmcnt(1)
	v_fmac_f32_e32 v21, v46, v10
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v3, v9, v10
	buffer_load_dword v4, off, s[44:47], s5 offset:32 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v5, v4, v13
	buffer_load_dword v6, off, s[44:47], s5 offset:28 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v5, v6, v12
	buffer_load_dword v7, off, s[44:47], s5 offset:36 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v5, v7, v11
	buffer_load_dword v8, off, s[44:47], s5 offset:40 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v5, v8, v14
	v_mul_f32_e32 v9, v4, v16
	v_fmac_f32_e32 v9, v6, v15
	v_fmac_f32_e32 v9, v7, v17
	v_fmac_f32_e32 v9, v8, v18
	v_mul_f32_e32 v10, v4, v20
	v_fmac_f32_e32 v10, v6, v19
	v_fmac_f32_e32 v10, v7, v21
	v_fmac_f32_e32 v10, v8, v3
	v_mov_b32_e32 v3, s1
	buffer_store_dword v5, off, s[44:47], s5 offset:44 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[44:47], s5 offset:48 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[44:47], s5 offset:52 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[44:47], s5 offset:56 ; 4-byte Folded Spill
	s_branch BB0_8
BB0_7:                                  ; %Flow
	v_readlane_b32 s0, v47, 20
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_branch BB0_9
BB0_8:                                  ; %endif1
	buffer_load_dword v0, off, s[44:47], s5 offset:52 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[44:47], s5 offset:48 ; 4-byte Folded Reload
	buffer_load_dword v2, off, s[44:47], s5 offset:44 ; 4-byte Folded Reload
	v_readlane_b32 s0, v47, 21
	v_readlane_b32 s1, v47, 22
	v_readlane_b32 s2, v47, 23
	v_readlane_b32 s3, v47, 24
	s_buffer_load_dword s4, s[0:3], 0x10
	s_buffer_load_dword s6, s[0:3], 0x14
	s_buffer_load_dword s7, s[0:3], 0x18
	s_buffer_load_dword s8, s[0:3], 0x1c
	s_waitcnt vmcnt(1) lgkmcnt(0)
	v_mul_f32_e32 v3, s6, v1
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v3, s4, v2
	v_fmac_f32_e32 v3, s7, v0
	buffer_load_dword v4, off, s[44:47], s5 offset:56 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v3, s8, v4
	s_buffer_load_dword s4, s[0:3], 0x20
	s_buffer_load_dword s6, s[0:3], 0x24
	s_buffer_load_dword s7, s[0:3], 0x28
	s_buffer_load_dword s8, s[0:3], 0x2c
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v5, s6, v1
	v_fmac_f32_e32 v5, s4, v2
	v_fmac_f32_e32 v5, s7, v0
	v_fmac_f32_e32 v5, s8, v4
	s_buffer_load_dword s4, s[0:3], 0x30
	s_buffer_load_dword s6, s[0:3], 0x34
	s_buffer_load_dword s7, s[0:3], 0x38
	s_buffer_load_dword s8, s[0:3], 0x3c
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v6, s6, v1
	v_fmac_f32_e32 v6, s4, v2
	v_fmac_f32_e32 v6, s7, v0
	v_fmac_f32_e32 v6, s8, v4
	s_buffer_load_dword s4, s[0:3], 0x40
	s_buffer_load_dword s6, s[0:3], 0x44
	s_buffer_load_dword s7, s[0:3], 0x48
	s_buffer_load_dword s8, s[0:3], 0x4c
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v1, s6, v1
	v_fmac_f32_e32 v1, s4, v2
	v_fmac_f32_e32 v1, s7, v0
	v_fmac_f32_e32 v1, s8, v4
	exp pos0 v3, v5, v6, v1 done vm
	s_branch BB0_7
BB0_9:                                  ; %endif6002
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 2684
; NumSgprs: 50
; NumVgprs: 48
; ScratchSize: 60
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 6
; VGPRBlocks: 5
; NumSGPRsForWavesPerEU: 50
; NumVGPRsForWavesPerEU: 48
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
