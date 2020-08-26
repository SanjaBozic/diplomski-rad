	.text
	.section	.AMDGPU.config
	.long	45608
	.long	193
	.long	165608
	.long	4096
	.long	4
	.long	11
	.long	8
	.long	3
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s20, SCRATCH_RSRC_DWORD0
	s_mov_b32 s21, SCRATCH_RSRC_DWORD1
	s_mov_b32 s22, -1
	s_mov_b32 s23, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v5, off, s[20:23], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[20:23], s5 offset:8 ; 4-byte Folded Spill
	v_writelane_b32 v6, s16, 0
	v_writelane_b32 v6, s15, 1
	v_writelane_b32 v6, s14, 2
	v_writelane_b32 v6, s13, 3
	v_writelane_b32 v6, s12, 4
	v_writelane_b32 v6, s11, 5
	v_writelane_b32 v6, s10, 6
	v_writelane_b32 v6, s3, 7
	v_writelane_b32 v6, s2, 8
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v6, 8
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v6, 7
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[20:23], s5 offset:12 ; 4-byte Folded Spill
	v_writelane_b32 v6, s2, 9
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
	buffer_load_dword v3, off, s[20:23], s5 offset:8 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v6, 9
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v6, 7
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[20:23], s5 offset:12 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v6, s3, 10
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 2
	buffer_load_dword v0, off, s[20:23], s5 offset:4 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s0, s0, v0
	s_mov_b32 s1, 1
	v_cmp_eq_u32_e64 s1, s1, v0
	v_readlane_b32 s2, v6, 6
	v_mov_b32_e32 v1, s2
	v_readlane_b32 s3, v6, 5
	v_cndmask_b32_e64 v1, s3, v1, s0
                                        ; implicit-def: $sgpr0
	v_bfe_i32 v1, v1, 0, 16
	v_mov_b32_e32 v2, s3
	v_cndmask_b32_e64 v2, s2, v2, s1
	s_mov_b32 s0, 16
                                        ; implicit-def: $sgpr1
	v_ashrrev_i32_e32 v2, s0, v2
	v_cvt_f32_i32_e32 v1, v1
	v_cvt_f32_i32_e32 v2, v2
	v_mov_b32_e32 v3, 1.0
	v_readlane_b32 s0, v6, 4
	v_mov_b32_e32 v4, s0
	exp pos0 v1, v2, v4, v3 done vm
	v_readlane_b32 s1, v6, 3
	s_waitcnt expcnt(0)
	v_mov_b32_e32 v1, s1
	v_readlane_b32 s4, v6, 2
	v_mov_b32_e32 v2, s4
	v_readlane_b32 s6, v6, 1
	v_mov_b32_e32 v3, s6
	v_readlane_b32 s7, v6, 0
	v_mov_b32_e32 v4, s7
	exp param0 v1, v2, v3, v4
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v6, 10
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 576
; NumSgprs: 26
; NumVgprs: 7
; ScratchSize: 16
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
