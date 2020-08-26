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
	s_mov_b32 s0, exec_lo
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_mov_b32 s6, s3
	s_movk_i32 s7, 0x8000
	s_mov_b32 m0, s5
	s_mov_b32 s8, s2
	s_mov_b32 s11, 0x31016fac
	s_mov_b32 s10, 32
	s_load_dwordx8 s[12:19], s[6:7], 0x400
	s_load_dwordx4 s[36:39], s[6:7], 0x430
	s_load_dwordx8 s[20:27], s[6:7], 0x440
	s_load_dwordx4 s[44:47], s[6:7], 0x470
	s_load_dwordx8 s[28:35], s[6:7], 0x480
	s_load_dwordx4 s[56:59], s[6:7], 0x4b0
	v_interp_p1_f32_e32 v4, v2, attr1.x
	v_interp_p1_f32_e32 v5, v2, attr1.y
	s_mov_b32 s9, 0x8000
	v_mov_b32_e32 v1, 1.0
	v_interp_p2_f32_e32 v4, v3, attr1.x
	v_interp_p2_f32_e32 v5, v3, attr1.y
	s_buffer_load_dword s1, s[8:11], 0x0
	s_waitcnt lgkmcnt(0)
	image_sample v0, v[4:5], s[12:19], s[36:39] dmask:0x1 dim:SQ_RSRC_IMG_2D
	image_sample v6, v[4:5], s[20:27], s[44:47] dmask:0x1 dim:SQ_RSRC_IMG_2D
	image_sample v7, v[4:5], s[28:35], s[56:59] dmask:0x1 dim:SQ_RSRC_IMG_2D
	v_cmp_ngt_f32_e64 s1, s1, 0
	s_and_b32 vcc_lo, exec_lo, s1
	s_cbranch_vccnz BB0_2
; %bb.1:                                ; %if1
	s_load_dwordx8 s[12:19], s[6:7], 0x4c0
	s_load_dwordx4 s[20:23], s[6:7], 0x4f0
	s_waitcnt lgkmcnt(0)
	image_sample v1, v[4:5], s[12:19], s[20:23] dmask:0x1 dim:SQ_RSRC_IMG_2D
BB0_2:                                  ; %endif1
	v_nop
	s_and_b32 exec_lo, exec_lo, s0
	s_mov_b32 s0, 0xbf504000
	s_mov_b32 m0, s5
	s_mov_b32 s2, 0x40012400
	s_mov_b32 s1, 0x3fcc4300
	s_buffer_load_dword s3, s[8:11], 0x10
	s_waitcnt vmcnt(1)
	v_fma_f32 v5, v6, s0, 0x3f079ac0
	v_interp_p1_f32_e32 v4, v2, attr0.x
	v_interp_p1_f32_e32 v8, v2, attr0.y
	v_interp_p1_f32_e32 v9, v2, attr0.z
	v_fma_f32 v6, v6, s1, 0xbf5ee340
	s_mov_b32 s0, 0x3f950200
	s_waitcnt vmcnt(0)
	v_fma_f32 v10, v7, s2, 0xbf8a7420
	v_fmac_f32_e32 v5, 0xbec86c00, v7
	v_interp_p1_f32_e32 v2, v2, attr0.w
	v_interp_p2_f32_e32 v4, v3, attr0.x
	v_interp_p2_f32_e32 v8, v3, attr0.y
	v_interp_p2_f32_e32 v9, v3, attr0.z
	v_fmac_f32_e32 v6, s0, v0
	v_fmac_f32_e32 v5, s0, v0
	v_fmac_f32_e32 v10, s0, v0
	v_interp_p2_f32_e32 v2, v3, attr0.w
	v_mul_f32_e32 v0, v6, v4
	v_mul_f32_e32 v4, v5, v8
	v_mul_f32_e32 v5, v10, v9
	v_mul_f32_e32 v3, v1, v2
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v0, s3, v0
	v_mul_f32_e32 v1, s3, v4
	v_mul_f32_e32 v2, s3, v5
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 372
; NumSgprs: 62
; NumVgprs: 15
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 7
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 62
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
