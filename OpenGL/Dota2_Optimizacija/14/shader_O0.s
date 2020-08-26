	.text
	.section	.AMDGPU.config
	.long	45608
	.long	129
	.long	165608
	.long	4096
	.long	4
	.long	5
	.long	8
	.long	2
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s16, SCRATCH_RSRC_DWORD0
	s_mov_b32 s17, SCRATCH_RSRC_DWORD1
	s_mov_b32 s18, -1
	s_mov_b32 s19, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v0, off, s[16:19], s5 offset:4 ; 4-byte Folded Spill
	v_writelane_b32 v4, s10, 0
	v_writelane_b32 v4, s3, 1
	v_writelane_b32 v4, s2, 2
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v4, 2
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v4, 1
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_mbcnt_hi_u32_b32_e64 v0, s3, v0
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[16:19], s5 offset:8 ; 4-byte Folded Spill
	v_writelane_b32 v4, s2, 3
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
	buffer_load_dword v3, off, s[16:19], s5 offset:4 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v4, 3
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v4, 1
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[16:19], s5 offset:8 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v4, s3, 4
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0x31016fac
	s_movk_i32 s1, 0x50
	s_mov_b32 s2, 0x8000
	v_readlane_b32 s3, v4, 0
	s_mov_b32 s8, s3
	s_mov_b32 s9, s2
	s_mov_b32 s10, s1
	s_mov_b32 s11, s0
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s1, s[8:11], 0x4
	s_buffer_load_dword s2, s[8:11], 0x8
	s_buffer_load_dword s4, s[8:11], 0xc
	s_buffer_load_dword s6, s[8:11], 0x10
	s_buffer_load_dword s7, s[8:11], 0x14
	s_buffer_load_dword s12, s[8:11], 0x18
	s_buffer_load_dword s13, s[8:11], 0x1c
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e64 v0, s6, s0
	v_mul_f32_e64 v1, s7, s0
	v_mul_f32_e64 v2, s12, s0
	v_mul_f32_e64 v3, s13, s0
	s_buffer_load_dword s0, s[8:11], 0x20
	s_buffer_load_dword s6, s[8:11], 0x24
	s_buffer_load_dword s7, s[8:11], 0x28
	s_buffer_load_dword s12, s[8:11], 0x2c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e64 v0, s0, s1
	v_fmac_f32_e64 v1, s6, s1
	v_fmac_f32_e64 v2, s7, s1
	v_fmac_f32_e64 v3, s12, s1
	s_buffer_load_dword s0, s[8:11], 0x30
	s_buffer_load_dword s1, s[8:11], 0x34
	s_buffer_load_dword s6, s[8:11], 0x38
	s_buffer_load_dword s7, s[8:11], 0x3c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e64 v0, s0, s2
	v_fmac_f32_e64 v1, s1, s2
	v_fmac_f32_e64 v2, s6, s2
	v_fmac_f32_e64 v3, s7, s2
	s_buffer_load_dword s0, s[8:11], 0x40
	s_buffer_load_dword s1, s[8:11], 0x44
	s_buffer_load_dword s2, s[8:11], 0x48
	s_buffer_load_dword s6, s[8:11], 0x4c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e64 v0, s0, s4
	v_fmac_f32_e64 v1, s1, s4
	v_fmac_f32_e64 v2, s2, s4
	v_fmac_f32_e64 v3, s6, s4
	exp pos0 v0, v1, v2, v3 done vm
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v4, 4
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 700
; NumSgprs: 22
; NumVgprs: 5
; ScratchSize: 12
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 22
; NumVGPRsForWavesPerEU: 9
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
