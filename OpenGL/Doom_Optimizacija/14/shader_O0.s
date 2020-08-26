	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621885249
	.long	47180
	.long	0
	.long	47200
	.long	0
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
                                        ; implicit-def: $vcc_hi
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s20, s8
	s_mov_b32 s21, s9
	s_mov_b32 s22, s10
	s_mov_b32 s23, s11
	s_mov_b32 s24, s12
	s_mov_b32 s25, s13
	s_mov_b32 s26, s14
	s_mov_b32 s27, s15
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v4, v1
	v_mov_b32_e32 v5, v2
	s_mov_b32 s0, s4
	s_mov_b32 s1, s5
	s_mov_b32 s2, s6
	s_movk_i32 s7, 0x8000
	s_mov_b32 s28, s3
	s_mov_b32 s29, s7
                                        ; kill: def $vgpr3_vgpr4_vgpr5 killed $vgpr3_vgpr4_vgpr5 killed $exec
                                        ; kill: def $sgpr32_sgpr33_sgpr34_sgpr35_sgpr36_sgpr37_sgpr38_sgpr39 killed $sgpr20_sgpr21_sgpr22_sgpr23_sgpr24_sgpr25_sgpr26_sgpr27
                                        ; kill: def $sgpr0_sgpr1_sgpr2 killed $sgpr0_sgpr1_sgpr2
	s_mul_i32 s3, s4, s16
	s_mul_i32 s4, s5, s17
	s_mul_i32 s5, s6, s18
	v_add_nc_u32_e32 v0, s3, v0
	v_add_nc_u32_e32 v1, s4, v1
	v_add_nc_u32_e32 v2, s5, v2
	image_load v[6:9], v[0:2], s[20:27] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_waitcnt vmcnt(0)
	s_barrier
	v_nop
	s_load_dwordx8 s[20:27], s[28:29], 0x3c0
	s_waitcnt lgkmcnt(0)
	s_mov_b32 s3, s26
	s_mov_b32 s4, 0xffdfffff
	s_and_b32 s3, s3, s4
	s_mov_b32 s26, s3
	image_store v[6:9], v[0:2], s[20:27] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 156
; NumSgprs: 42
; NumVgprs: 10
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 42
; NumVGPRsForWavesPerEU: 10
; Occupancy: 20
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 0
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.globl	compute_lds
	.amdgpu_lds compute_lds, 0, 65536
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn----gfx1010"
