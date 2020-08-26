	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621885120
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
	s_mov_b32 s16, s2
	s_mov_b32 s19, 0x31016fac
	s_mov_b32 s18, 32
	s_mov_b32 s17, 0x8000
	s_mov_b32 s8, s3
	s_movk_i32 s9, 0x8000
	v_lshl_add_u32 v4, s4, 3, v0
	v_lshl_add_u32 v5, s5, 3, v1
	s_buffer_load_dwordx2 s[20:21], s[16:19], 0x0
	s_buffer_load_dword s24, s[16:19], 0x8
	v_add_nc_u32_e32 v6, s6, v2
	s_buffer_load_dwordx2 s[22:23], s[16:19], 0x10
	s_load_dwordx8 s[0:7], s[8:9], 0x3e0
	s_load_dwordx8 s[8:15], s[8:9], 0x3c0
	s_buffer_load_dword s16, s[16:19], 0x18
                                        ; implicit-def: $vcc_hi
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v0, s20, v4
	v_add_nc_u32_e32 v1, s21, v5
	v_add_nc_u32_e32 v2, s24, v6
	v_add_nc_u32_e32 v4, s22, v4
	v_add_nc_u32_e32 v5, s23, v5
	s_bitset0_b32 s14, 21
	v_add_nc_u32_e32 v6, s16, v6
	image_load v[0:3], v[0:2], s[0:7] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_waitcnt vmcnt(0)
	image_store v[0:3], v[4:6], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 156
; NumSgprs: 27
; NumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 27
; NumVGPRsForWavesPerEU: 7
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
