	.text
	.section	.AMDGPU.config
	.long	45608
	.long	257
	.long	165608
	.long	4096
	.long	4
	.long	0
	.long	8
	.long	1
	.text
	.globl	vs_prolog               ; -- Begin function vs_prolog
	.p2align	8
	.type	vs_prolog,@function
vs_prolog:                              ; @vs_prolog
; %bb.0:                                ; %main_body
	s_mov_b32 s32, SCRATCH_RSRC_DWORD0
	s_mov_b32 s33, SCRATCH_RSRC_DWORD1
	s_mov_b32 s34, -1
	s_mov_b32 s35, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_bfe_u32 s28, s3, 0x70000
	s_bfm_b32 exec_lo, s28, 0
	s_cmp_eq_u32 s28, 32
	s_cmov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s28, s5
	v_add_nc_u32_e32 v9, s13, v5
	s_mov_b32 s5, s28
	buffer_store_dword v9, off, s[32:35], s5 offset:4 ; 4-byte Folded Spill
	buffer_load_dword v10, off, s[32:35], s5 offset:4 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	; return to shader part epilog
.Lfunc_end0:
	.size	vs_prolog, .Lfunc_end0-vs_prolog
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 84
; NumSgprs: 38
; NumVgprs: 11
; ScratchSize: 8
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 38
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
