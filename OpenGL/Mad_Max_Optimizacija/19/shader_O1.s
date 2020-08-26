	.text
	.section	.AMDGPU.config
	.long	45096
	.long	451
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
	s_mov_b32 s1, exec_lo
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_mov_b32 s6, s3
	s_mov_b32 s0, s2
	s_movk_i32 s7, 0x8000
	s_load_dwordx8 s[8:15], s[6:7], 0x400
	s_load_dwordx4 s[16:19], s[6:7], 0x430
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v0, v2, attr0.x
	v_interp_p1_f32_e32 v1, v2, attr0.y
	v_interp_p2_f32_e32 v0, v3, attr0.x
	v_interp_p2_f32_e32 v1, v3, attr0.y
	s_and_b32 exec_lo, exec_lo, s1
	s_waitcnt lgkmcnt(0)
	image_sample v2, v[0:1], s[8:15], s[16:19] dmask:0x1 dim:SQ_RSRC_IMG_2D
	v_nop
	s_load_dwordx8 s[8:15], s[6:7], 0x440
	s_load_dwordx4 s[52:55], s[6:7], 0x470
	s_load_dwordx8 s[16:23], s[6:7], 0x480
	s_load_dwordx4 s[28:31], s[6:7], 0x4b0
	s_mov_b32 s3, 0x31016fac
	s_mov_b32 s2, 64
	s_mov_b32 s1, 0x8000
	s_buffer_load_dwordx4 s[32:35], s[0:3], 0x4
	s_buffer_load_dword s5, s[0:3], 0x0
	s_buffer_load_dwordx4 s[36:39], s[0:3], 0x14
	s_buffer_load_dwordx4 s[0:3], s[0:3], 0x24
	s_waitcnt lgkmcnt(0)
	image_sample v3, v[0:1], s[8:15], s[52:55] dmask:0x1 dim:SQ_RSRC_IMG_2D
	image_sample v0, v[0:1], s[16:23], s[28:31] dmask:0x1 dim:SQ_RSRC_IMG_2D
	s_waitcnt vmcnt(2)
	v_add_f32_e32 v1, s32, v2
	s_waitcnt vmcnt(1)
	v_add_f32_e32 v2, s33, v3
	s_waitcnt vmcnt(0)
	v_add_f32_e32 v5, s34, v0
	v_mul_f32_e32 v3, s38, v2
	v_mul_f32_e32 v4, s39, v2
	v_mul_f32_e32 v2, s0, v2
	v_fmac_f32_e32 v3, s35, v1
	v_fmac_f32_e32 v4, s36, v1
	v_fmac_f32_e32 v2, s37, v1
	v_fmac_f32_e32 v3, s1, v5
	v_fmac_f32_e32 v4, s2, v5
	v_fmac_f32_e32 v2, s3, v5
	v_mul_f32_e32 v0, s5, v3
	v_mul_f32_e32 v1, s5, v4
	v_mul_f32_e32 v2, s5, v2
	v_mov_b32_e32 v3, s5
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 256
; NumSgprs: 58
; NumVgprs: 15
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 7
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 58
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
