	.text
	.section	.AMDGPU.config
	.long	45608
	.long	257
	.long	165608
	.long	4096
	.long	4
	.long	13
	.long	8
	.long	4
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s28, SCRATCH_RSRC_DWORD0
	s_mov_b32 s29, SCRATCH_RSRC_DWORD1
	s_mov_b32 s30, -1
	s_mov_b32 s31, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s12, s24
	s_mov_b32 s13, s25
	s_mov_b32 s14, s26
	s_mov_b32 s15, s27
	s_mov_b32 s16, s20
	s_mov_b32 s17, s21
	s_mov_b32 s18, s22
	s_mov_b32 s19, s23
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v10, off, s[28:31], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[28:31], s5 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[28:31], s5 offset:12 ; 4-byte Folded Spill
	v_writelane_b32 v11, s10, 0
	v_writelane_b32 v11, s3, 1
	v_writelane_b32 v11, s2, 2
	v_writelane_b32 v11, s12, 3
	v_writelane_b32 v11, s13, 4
	v_writelane_b32 v11, s14, 5
	v_writelane_b32 v11, s15, 6
	v_writelane_b32 v11, s16, 7
	v_writelane_b32 v11, s17, 8
	v_writelane_b32 v11, s18, 9
	v_writelane_b32 v11, s19, 10
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v11, 2
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v11, 1
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_mbcnt_hi_u32_b32_e64 v0, s3, v0
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[28:31], s5 offset:16 ; 4-byte Folded Spill
	v_writelane_b32 v11, s2, 11
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
	buffer_load_dword v3, off, s[28:31], s5 offset:12 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v11, 11
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v11, 1
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[28:31], s5 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v11, s3, 12
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[28:31], s5 offset:8 ; 4-byte Folded Reload
	v_readlane_b32 s8, v11, 7
	v_readlane_b32 s9, v11, 8
	v_readlane_b32 s10, v11, 9
	v_readlane_b32 s11, v11, 10
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[1:4], v0, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v3
                                        ; kill: def $vgpr4 killed $vgpr4 killed $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
	buffer_load_dword v1, off, s[28:31], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s12, v11, 3
	v_readlane_b32 s13, v11, 4
	v_readlane_b32 s14, v11, 5
	v_readlane_b32 s15, v11, 6
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_x v2, v1, s[12:15], s0 idxen
	s_waitcnt vmcnt(0)
	v_trunc_f32_e32 v2, v2
	s_mov_b32 s1, 0
	v_max_f32_e32 v2, s1, v2
	s_mov_b32 s1, 0x40400000
	v_min_f32_e32 v2, s1, v2
	v_cvt_i32_f32_e32 v2, v2
	s_mov_b32 s1, 3
                                        ; implicit-def: $sgpr2
	v_lshlrev_b32_e32 v2, s1, v2
	s_mov_b32 s1, 0x31016fac
	s_movk_i32 s2, 0x60
	s_mov_b32 s3, 0x8000
	v_readlane_b32 s4, v11, 0
	s_mov_b32 s16, s4
	s_mov_b32 s17, s3
	s_mov_b32 s18, s2
	s_mov_b32 s19, s1
	v_mov_b32_e32 v3, v2
	buffer_load_dword v3, v3, s[16:19], s0 offen offset:64
	buffer_load_dword v2, v2, s[16:19], s0 offen offset:68
	v_nop
	s_buffer_load_dword s0, s[16:19], 0x0
	s_buffer_load_dword s1, s[16:19], 0x4
	s_buffer_load_dword s2, s[16:19], 0x8
	s_buffer_load_dword s3, s[16:19], 0xc
	s_buffer_load_dword s6, s[16:19], 0x10
	s_buffer_load_dword s7, s[16:19], 0x14
	s_buffer_load_dword s20, s[16:19], 0x18
	s_buffer_load_dword s21, s[16:19], 0x1c
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mul_f32_e32 v6, s6, v2
	v_mul_f32_e32 v7, s7, v2
	v_mul_f32_e32 v8, s20, v2
	v_mul_f32_e32 v2, s21, v2
	v_fmac_f32_e32 v6, s0, v3
	v_fmac_f32_e32 v7, s1, v3
	v_fmac_f32_e32 v8, s2, v3
	v_fmac_f32_e32 v2, s3, v3
	s_buffer_load_dword s0, s[16:19], 0x20
	s_buffer_load_dword s1, s[16:19], 0x24
	s_buffer_load_dword s2, s[16:19], 0x28
	s_buffer_load_dword s3, s[16:19], 0x2c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v6, s0, v5
	v_fmac_f32_e32 v7, s1, v5
	v_fmac_f32_e32 v8, s2, v5
	v_fmac_f32_e32 v2, s3, v5
	s_buffer_load_dword s0, s[16:19], 0x30
	s_buffer_load_dword s1, s[16:19], 0x34
	s_buffer_load_dword s2, s[16:19], 0x38
	s_buffer_load_dword s3, s[16:19], 0x3c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v6, s0, v4
	v_fmac_f32_e32 v7, s1, v4
	v_fmac_f32_e32 v8, s2, v4
	v_fmac_f32_e32 v2, s3, v4
	exp pos0 v6, v7, v8, v2 done vm
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v11, 12
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 924
; NumSgprs: 34
; NumVgprs: 12
; ScratchSize: 20
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
