	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621885185
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
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v4, v1
	v_mov_b32_e32 v5, v2
	s_movk_i32 s0, 0x8000
	s_mov_b32 s8, s3
	s_mov_b32 s9, s0
                                        ; kill: def $vgpr3_vgpr4_vgpr5 killed $vgpr3_vgpr4_vgpr5 killed $exec
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 32
	s_mov_b32 s3, 0x8000
	s_mov_b32 s12, s2
	s_mov_b32 s13, s3
	s_mov_b32 s14, s1
	s_mov_b32 s15, s0
	s_buffer_load_dword s0, s[12:15], 0x0
	s_buffer_load_dword s1, s[12:15], 0x4
	s_buffer_load_dword s2, s[12:15], 0x8
	s_mov_b32 s3, 3
	v_lshl_add_u32 v0, s4, s3, v0
	v_lshl_add_u32 v1, s5, s3, v1
	v_add_nc_u32_e32 v2, s6, v2
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v6, s0, v0
	v_add_nc_u32_e32 v7, s1, v1
	v_add_nc_u32_e32 v8, s2, v2
	s_load_dwordx8 s[16:23], s[8:9], 0x3c0
	s_load_dwordx8 s[24:31], s[8:9], 0x3e0
	s_waitcnt lgkmcnt(0)
	image_load v[9:12], v[6:8], s[24:31] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_buffer_load_dword s0, s[12:15], 0x10
	s_buffer_load_dword s1, s[12:15], 0x14
	s_buffer_load_dword s2, s[12:15], 0x18
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v0, s0, v0
	v_add_nc_u32_e32 v1, s1, v1
	v_add_nc_u32_e32 v2, s2, v2
	s_mov_b32 s0, s22
	s_mov_b32 s1, 0xffdfffff
	s_and_b32 s0, s0, s1
	s_mov_b32 s22, s0
	s_waitcnt vmcnt(0)
	image_store v[9:12], v[0:2], s[16:23] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 228
; NumSgprs: 34
; NumVgprs: 13
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 34
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
