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
	v_writelane_b32 v12, s10, 0
	v_writelane_b32 v12, s3, 1
	v_writelane_b32 v12, s2, 2
	v_writelane_b32 v12, s12, 3
	v_writelane_b32 v12, s13, 4
	v_writelane_b32 v12, s14, 5
	v_writelane_b32 v12, s15, 6
	v_writelane_b32 v12, s16, 7
	v_writelane_b32 v12, s17, 8
	v_writelane_b32 v12, s18, 9
	v_writelane_b32 v12, s19, 10
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v12, 2
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v12, 1
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[28:31], s5 offset:16 ; 4-byte Folded Spill
	v_writelane_b32 v12, s2, 11
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
	v_readlane_b32 s0, v12, 11
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v12, 1
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[28:31], s5 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v12, s3, 12
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[28:31], s5 offset:8 ; 4-byte Folded Reload
	v_readlane_b32 s8, v12, 7
	v_readlane_b32 s9, v12, 8
	v_readlane_b32 s10, v12, 9
	v_readlane_b32 s11, v12, 10
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[1:4], v0, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v1
	v_mov_b32_e32 v6, v2
	buffer_load_dword v7, off, s[28:31], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s12, v12, 3
	v_readlane_b32 s13, v12, 4
	v_readlane_b32 s14, v12, 5
	v_readlane_b32 s15, v12, 6
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xy v[8:9], v7, s[12:15], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v10, v8
                                        ; kill: def $vgpr9 killed $vgpr9 killed $vgpr8_vgpr9 killed $exec
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 16
	s_mov_b32 s2, 0x8000
	v_readlane_b32 s3, v12, 0
	s_mov_b32 s16, s3
	s_mov_b32 s17, s2
	s_mov_b32 s18, s1
	s_mov_b32 s19, s0
	s_buffer_load_dword s0, s[16:19], 0x8
	s_buffer_load_dword s1, s[16:19], 0xc
	s_waitcnt lgkmcnt(0)
	v_rcp_f32_e32 v8, s0
	v_rcp_f32_e32 v11, s1
	v_mul_f32_e32 v5, v5, v8
	v_mul_f32_e32 v6, v6, v11
	v_mov_b32_e32 v8, -1.0
	s_mov_b32 s0, 2.0
	v_fmac_f32_e32 v8, s0, v5
	v_mov_b32_e32 v5, 1.0
	s_mov_b32 s0, -2.0
	v_fmac_f32_e32 v5, s0, v6
	v_mov_b32_e32 v6, v3
                                        ; kill: def $vgpr4 killed $vgpr4 killed $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
	exp pos0 v8, v5, v6, v4 done vm
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v1, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
	exp param0 v10, v9, v1, v2
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v12, 12
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 740
; NumSgprs: 34
; NumVgprs: 13
; ScratchSize: 20
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 34
; NumVGPRsForWavesPerEU: 13
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
