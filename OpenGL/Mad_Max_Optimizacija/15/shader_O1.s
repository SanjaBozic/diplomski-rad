	.text
	.section	.AMDGPU.config
	.long	45096
	.long	131
	.long	165608
	.long	0
	.long	45100
	.long	0
	.long	165580
	.long	16386
	.long	165584
	.long	61559
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s6, exec_lo
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_mov_b32 s0, s3
	s_movk_i32 s1, 0x8000
	s_load_dwordx8 s[8:15], s[0:1], 0x400
	s_load_dwordx4 s[0:3], s[0:1], 0x430
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v0, v2, attr0.x
	v_interp_p1_f32_e32 v1, v2, attr0.y
	v_interp_p2_f32_e32 v0, v3, attr0.x
	v_interp_p2_f32_e32 v1, v3, attr0.y
	s_and_b32 exec_lo, exec_lo, s6
	s_waitcnt lgkmcnt(0)
	image_sample v[0:2], v[0:1], s[8:15], s[0:3] dmask:0x7 dim:SQ_RSRC_IMG_2D
	v_mov_b32_e32 v3, 1.0
	s_waitcnt vmcnt(0)
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 76
; NumSgprs: 18
; NumVgprs: 15
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 18
; NumVGPRsForWavesPerEU: 26
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
