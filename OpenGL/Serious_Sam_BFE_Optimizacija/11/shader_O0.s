	.text
	.section	.AMDGPU.config
	.long	45096
	.long	131
	.long	165608
	.long	0
	.long	45100
	.long	0
	.long	165580
	.long	17152
	.long	165584
	.long	62327
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
	s_movk_i32 s0, 0x8000
	s_mov_b32 s8, s3
	s_mov_b32 s9, s0
	s_mov_b32 m0, s5
	v_interp_mov_f32_e32 v0, p0, attr0.x
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 64
	s_mov_b32 s3, 0x8000
	s_mov_b32 s12, s2
	s_mov_b32 s13, s3
	s_mov_b32 s14, s1
	s_mov_b32 s15, s0
	s_buffer_load_dword s0, s[12:15], 0x0
	s_buffer_load_dword s1, s[12:15], 0x4
	s_buffer_load_dword s2, s[12:15], 0x8
	s_buffer_load_dword s3, s[12:15], 0xc
	v_cvt_i32_f32_e32 v1, v12
	v_cvt_i32_f32_e32 v2, v13
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v1, s0, v1
	v_add_nc_u32_e32 v2, s1, v2
                                        ; implicit-def: $sgpr0
	v_mul_lo_u32 v2, v2, s2
                                        ; implicit-def: $sgpr0
	v_mul_lo_u32 v0, v0, s3
	v_add3_u32 v0, v1, v2, v0
	s_load_dwordx4 s[12:15], s[8:9], 0x410
	s_mov_b32 s0, 0
	s_waitcnt lgkmcnt(0)
	buffer_load_format_xyzw v[3:6], v0, s[12:15], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v3
	v_mov_b32_e32 v1, v4
	v_mov_b32_e32 v2, v5
                                        ; kill: def $vgpr6 killed $vgpr6 killed $vgpr3_vgpr4_vgpr5_vgpr6 killed $exec
                                        ; implicit-def: $sgpr0
                                        ; implicit-def: $sgpr1
                                        ; implicit-def: $sgpr2
                                        ; implicit-def: $sgpr3
	v_mov_b32_e32 v3, v6
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v4, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v5, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v6, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v7, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v8, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v9, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v10, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v11, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v12, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v13, s5
	v_mov_b32_e32 v14, v16
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 220
; NumSgprs: 18
; NumVgprs: 17
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
