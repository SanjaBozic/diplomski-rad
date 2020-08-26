	.text
	.section	.AMDGPU.config
	.long	45608
	.long	322
	.long	165608
	.long	4096
	.long	4
	.long	17
	.long	8
	.long	5
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s36, SCRATCH_RSRC_DWORD0
	s_mov_b32 s37, SCRATCH_RSRC_DWORD1
	s_mov_b32 s38, -1
	s_mov_b32 s39, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s12, s28
	s_mov_b32 s13, s29
	s_mov_b32 s14, s30
	s_mov_b32 s15, s31
	s_mov_b32 s16, s24
	s_mov_b32 s17, s25
	s_mov_b32 s18, s26
	s_mov_b32 s19, s27
	s_mov_b32 s32, s20
	s_mov_b32 s33, s21
	s_mov_b32 s34, s22
	s_mov_b32 s35, s23
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v11, off, s[36:39], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[36:39], s5 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[36:39], s5 offset:12 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[36:39], s5 offset:16 ; 4-byte Folded Spill
	v_writelane_b32 v17, s10, 0
	v_writelane_b32 v17, s3, 1
	v_writelane_b32 v17, s2, 2
	v_writelane_b32 v17, s12, 3
	v_writelane_b32 v17, s13, 4
	v_writelane_b32 v17, s14, 5
	v_writelane_b32 v17, s15, 6
	v_writelane_b32 v17, s16, 7
	v_writelane_b32 v17, s17, 8
	v_writelane_b32 v17, s18, 9
	v_writelane_b32 v17, s19, 10
	v_writelane_b32 v17, s32, 11
	v_writelane_b32 v17, s33, 12
	v_writelane_b32 v17, s34, 13
	v_writelane_b32 v17, s35, 14
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v17, 2
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v17, 1
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[36:39], s5 offset:20 ; 4-byte Folded Spill
	v_writelane_b32 v17, s2, 15
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
	buffer_load_dword v3, off, s[36:39], s5 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v17, 15
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v17, 1
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[36:39], s5 offset:20 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v17, s3, 16
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[36:39], s5 offset:12 ; 4-byte Folded Reload
	v_readlane_b32 s8, v17, 11
	v_readlane_b32 s9, v17, 12
	v_readlane_b32 s10, v17, 13
	v_readlane_b32 s11, v17, 14
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[1:4], v0, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v1
	v_mov_b32_e32 v6, v2
	buffer_load_dword v7, off, s[36:39], s5 offset:8 ; 4-byte Folded Reload
	v_readlane_b32 s12, v17, 7
	v_readlane_b32 s13, v17, 8
	v_readlane_b32 s14, v17, 9
	v_readlane_b32 s15, v17, 10
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[8:11], v7, s[12:15], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v12, v8
	v_mov_b32_e32 v13, v9
	v_mov_b32_e32 v14, v10
                                        ; kill: def $vgpr11 killed $vgpr11 killed $vgpr8_vgpr9_vgpr10_vgpr11 killed $exec
	buffer_load_dword v8, off, s[36:39], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s16, v17, 3
	v_readlane_b32 s17, v17, 4
	v_readlane_b32 s18, v17, 5
	v_readlane_b32 s19, v17, 6
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xy v[9:10], v8, s[16:19], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v15, v9
                                        ; kill: def $vgpr10 killed $vgpr10 killed $vgpr9_vgpr10 killed $exec
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 16
	s_mov_b32 s2, 0x8000
	v_readlane_b32 s3, v17, 0
	s_mov_b32 s20, s3
	s_mov_b32 s21, s2
	s_mov_b32 s22, s1
	s_mov_b32 s23, s0
	s_buffer_load_dword s0, s[20:23], 0x8
	s_buffer_load_dword s1, s[20:23], 0xc
	s_waitcnt lgkmcnt(0)
	v_rcp_f32_e32 v9, s0
	v_rcp_f32_e32 v16, s1
	v_mul_f32_e32 v5, v5, v9
	v_mul_f32_e32 v6, v6, v16
	v_mov_b32_e32 v9, -1.0
	s_mov_b32 s0, 2.0
	v_fmac_f32_e32 v9, s0, v5
	v_mov_b32_e32 v5, 1.0
	s_mov_b32 s0, -2.0
	v_fmac_f32_e32 v5, s0, v6
	v_mov_b32_e32 v6, v3
                                        ; kill: def $vgpr4 killed $vgpr4 killed $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
	exp pos0 v9, v5, v6, v4 done vm
	exp param0 v12, v13, v14, v11
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v1, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
	exp param1 v15, v10, v1, v2
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v17, 16
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 888
; NumSgprs: 42
; NumVgprs: 18
; ScratchSize: 24
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 2
; NumSGPRsForWavesPerEU: 42
; NumVGPRsForWavesPerEU: 18
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