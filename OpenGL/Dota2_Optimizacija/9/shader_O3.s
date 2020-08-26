	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621885121
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
	s_mov_b32 s0, s2
	s_mov_b32 s20, s3
	s_mov_b32 s3, 0x31016fac
	s_mov_b32 s2, 32
	s_mov_b32 s1, 0x8000
	s_mul_i32 s4, s4, s16
	s_mul_i32 s5, s5, s17
	s_mul_i32 s6, s6, s18
	s_movk_i32 s21, 0x8000
	s_buffer_load_dwordx2 s[16:17], s[0:3], 0x0
	s_buffer_load_dword s22, s[0:3], 0x8
	s_buffer_load_dwordx2 s[18:19], s[0:3], 0x10
	v_add_nc_u32_e32 v0, s4, v0
	v_add_nc_u32_e32 v1, s5, v1
	v_add_nc_u32_e32 v2, s6, v2
	s_buffer_load_dword s23, s[0:3], 0x18
	s_load_dwordx8 s[0:7], s[20:21], 0x3c0
                                        ; implicit-def: $vcc_hi
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v3, s16, v0
	v_add_nc_u32_e32 v4, s17, v1
	v_add_nc_u32_e32 v5, s22, v2
	v_add_nc_u32_e32 v6, s18, v0
	v_add_nc_u32_e32 v7, s19, v1
	v_add_nc_u32_e32 v8, s23, v2
	image_load v[0:3], v[3:5], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_bitset0_b32 s6, 21
	s_waitcnt vmcnt(0)
	image_store v[0:3], v[6:8], s[0:7] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 152
; NumSgprs: 26
; NumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 26
; NumVGPRsForWavesPerEU: 9
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
