	.text
	.section	.AMDGPU.config
	.long	45608
	.long	257
	.long	165608
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	vs_prolog               ; -- Begin function vs_prolog
	.p2align	8
	.type	vs_prolog,@function
vs_prolog:                              ; @vs_prolog
; %bb.0:                                ; %main_body
	s_bfe_u32 s32, s3, 0x70000
	s_bfm_b32 exec_lo, s32, 0
	s_cmp_eq_u32 s32, 32
	s_cmov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	v_add_nc_u32_e32 v9, s13, v5
	v_mov_b32_e32 v10, v9
	v_mov_b32_e32 v11, v9
	; return to shader part epilog
.Lfunc_end0:
	.size	vs_prolog, .Lfunc_end0-vs_prolog
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 32
; NumSgprs: 35
; NumVgprs: 12
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 35
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
