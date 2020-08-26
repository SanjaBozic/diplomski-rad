	.text
	.section	.AMDGPU.config
	.long	45096
	.long	3
	.long	165608
	.long	0
	.long	45100
	.long	0
	.long	165580
	.long	15
	.long	165584
	.long	16777215
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	ps_epilog               ; -- Begin function ps_epilog
	.p2align	8
	.type	ps_epilog,@function
ps_epilog:                              ; @ps_epilog
; %bb.0:                                ; %main_body
	v_cvt_pkrtz_f16_f32_e32 v0, v0, v1
	v_cvt_pkrtz_f16_f32_e32 v1, v2, v3
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v3, s0
	exp mrt0 v0, v0, v1, v1 done compr vm
	s_endpgm
.Lfunc_end0:
	.size	ps_epilog, .Lfunc_end0-ps_epilog
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 28
; NumSgprs: 5
; NumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 0
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 5
; NumVGPRsForWavesPerEU: 15
; Occupancy: 10
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 0
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn----gfx600"
