	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621885313
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
	s_mov_b32 s30, s4
	s_mov_b32 s31, s5
	s_mov_b32 s32, s6
	s_movk_i32 s0, 0x8000
	s_mov_b32 s28, s3
	s_mov_b32 s29, s0
                                        ; kill: def $vgpr3_vgpr4_vgpr5 killed $vgpr3_vgpr4_vgpr5 killed $exec
                                        ; kill: def $sgpr36_sgpr37_sgpr38_sgpr39_sgpr40_sgpr41_sgpr42_sgpr43 killed $sgpr20_sgpr21_sgpr22_sgpr23_sgpr24_sgpr25_sgpr26_sgpr27
                                        ; kill: def $sgpr30_sgpr31_sgpr32 killed $sgpr30_sgpr31_sgpr32
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 32
	s_mov_b32 s3, 0x8000
	s_mov_b32 s44, s2
	s_mov_b32 s45, s3
	s_mov_b32 s46, s1
	s_mov_b32 s47, s0
	s_buffer_load_dword s0, s[44:47], 0x0
	s_buffer_load_dword s1, s[44:47], 0x4
	s_buffer_load_dword s2, s[44:47], 0x8
	s_mul_i32 s3, s4, s16
	s_mul_i32 s4, s5, s17
	s_mul_i32 s5, s6, s18
	v_add_nc_u32_e32 v0, s3, v0
	v_add_nc_u32_e32 v1, s4, v1
	v_add_nc_u32_e32 v2, s5, v2
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v6, s0, v0
	v_add_nc_u32_e32 v7, s1, v1
	v_add_nc_u32_e32 v8, s2, v2
	image_load v[9:12], v[6:8], s[20:27] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_buffer_load_dword s0, s[44:47], 0x10
	s_buffer_load_dword s1, s[44:47], 0x14
	s_buffer_load_dword s2, s[44:47], 0x18
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v0, s0, v0
	v_add_nc_u32_e32 v1, s1, v1
	v_add_nc_u32_e32 v2, s2, v2
	s_load_dwordx8 s[20:27], s[28:29], 0x3c0
	s_waitcnt lgkmcnt(0)
	s_mov_b32 s0, s26
	s_mov_b32 s1, 0xffdfffff
	s_and_b32 s0, s0, s1
	s_mov_b32 s26, s0
	s_waitcnt vmcnt(0)
	image_store v[9:12], v[0:2], s[20:27] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 264
; NumSgprs: 50
; NumVgprs: 13
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 6
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 50
; NumVGPRsForWavesPerEU: 13
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
