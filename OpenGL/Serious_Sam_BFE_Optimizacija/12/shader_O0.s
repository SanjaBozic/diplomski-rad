	.text
	.section	.AMDGPU.config
	.long	45608
	.long	193
	.long	165608
	.long	4096
	.long	4
	.long	8
	.long	8
	.long	4
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s12, SCRATCH_RSRC_DWORD0
	s_mov_b32 s13, SCRATCH_RSRC_DWORD1
	s_mov_b32 s14, -1
	s_mov_b32 s15, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s8, s20
	s_mov_b32 s9, s21
	s_mov_b32 s10, s22
	s_mov_b32 s11, s23
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v9, off, s[12:15], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[12:15], s5 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[12:15], s5 offset:12 ; 4-byte Folded Spill
	v_writelane_b32 v10, s3, 0
	v_writelane_b32 v10, s2, 1
	v_writelane_b32 v10, s8, 2
	v_writelane_b32 v10, s9, 3
	v_writelane_b32 v10, s10, 4
	v_writelane_b32 v10, s11, 5
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v10, 1
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v10, 0
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[12:15], s5 offset:16 ; 4-byte Folded Spill
	v_writelane_b32 v10, s2, 6
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
	buffer_load_dword v3, off, s[12:15], s5 offset:12 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v10, 6
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v10, 0
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[12:15], s5 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v10, s3, 7
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[12:15], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s8, v10, 2
	v_readlane_b32 s9, v10, 3
	v_readlane_b32 s10, v10, 4
	v_readlane_b32 s11, v10, 5
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
	exp pos0 v5, v6, v7, v4 vm
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v1, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v3, s0
	s_waitcnt expcnt(0)
	buffer_load_dword v4, off, s[12:15], s5 offset:8 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp pos1 off, off, v4, off done
                                        ; implicit-def: $sgpr0
	s_waitcnt expcnt(0)
	v_mov_b32_e32 v1, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v3, s0
	exp param0 v4, v1, v2, v3
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v10, 7
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 548
; NumSgprs: 26
; NumVgprs: 11
; ScratchSize: 20
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 26
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
