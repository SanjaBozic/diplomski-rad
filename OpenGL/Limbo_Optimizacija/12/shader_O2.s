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
	s_mov_b32 s20, exec_lo
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_mov_b32 s6, s3
	s_movk_i32 s7, 0x8000
	s_mov_b32 m0, s5
	s_mov_b32 s0, s2
	s_mov_b32 s3, 0x31016fac
	s_mov_b32 s2, 32
	s_load_dwordx8 s[8:15], s[6:7], 0x400
	s_load_dwordx4 s[16:19], s[6:7], 0x430
	v_interp_p1_f32_e32 v4, v2, attr0.x
	v_interp_p1_f32_e32 v5, v2, attr0.y
	v_interp_p1_f32_e32 v6, v2, attr0.z
	v_interp_p1_f32_e32 v10, v2, attr0.w
	v_interp_p1_f32_e32 v0, v2, attr1.x
	v_interp_p1_f32_e32 v1, v2, attr1.y
	v_interp_p2_f32_e32 v4, v3, attr0.x
	v_interp_p2_f32_e32 v5, v3, attr0.y
	v_interp_p2_f32_e32 v6, v3, attr0.z
	v_interp_p2_f32_e32 v10, v3, attr0.w
	v_interp_p2_f32_e32 v0, v3, attr1.x
	v_interp_p2_f32_e32 v1, v3, attr1.y
	s_mov_b32 s1, 0x8000
	s_and_b32 exec_lo, exec_lo, s20
	s_waitcnt lgkmcnt(0)
	image_sample v[18:21], v[0:1], s[8:15], s[16:19] dmask:0xf dim:SQ_RSRC_IMG_2D
	s_buffer_load_dwordx2 s[6:7], s[0:3], 0x0
	s_buffer_load_dword s5, s[0:3], 0x8
	s_buffer_load_dwordx2 s[0:1], s[0:3], 0xc
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v0, v18, v4
	v_mul_f32_e32 v1, v19, v5
	v_mul_f32_e32 v2, v20, v6
	v_mul_f32_e32 v3, v21, v10
	s_waitcnt lgkmcnt(0)
	v_fma_f32 v0, v0, s6, s1
	v_fma_f32 v1, v1, s7, s1
	v_fma_f32 v2, v2, s5, s1
	v_mul_f32_e32 v3, s0, v3
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 200
; NumSgprs: 23
; NumVgprs: 22
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 23
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
