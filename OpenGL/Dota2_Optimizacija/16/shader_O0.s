	.text
	.section	.AMDGPU.config
	.long	45096
	.long	195
	.long	165608
	.long	4096
	.long	45100
	.long	0
	.long	165580
	.long	16386
	.long	165584
	.long	61559
	.long	4
	.long	0
	.long	8
	.long	1
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s24, SCRATCH_RSRC_DWORD0
	s_mov_b32 s25, SCRATCH_RSRC_DWORD1
	s_mov_b32 s26, -1
	s_mov_b32 s27, 0x31c16000
	s_mov_b32 s0, exec_lo
                                        ; implicit-def: $vcc_hi
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_movk_i32 s1, 0x8000
	s_mov_b32 s8, s3
	s_mov_b32 s9, s1
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
                                        ; kill: def $vgpr4_vgpr5 killed $vgpr0_vgpr1 killed $exec
	v_mov_b32_e32 v2, v0
                                        ; kill: def $vgpr1 killed $vgpr1 killed $vgpr0_vgpr1 killed $exec
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v0, v2, attr0.x
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v0, v1, attr0.x
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v3, v2, attr0.y
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v3, v1, attr0.y
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v6, v2, attr0.z
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v6, v1, attr0.z
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v7, v2, attr0.w
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v7, v1, attr0.w
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v8, v2, attr1.x
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v8, v1, attr1.x
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v2, v2, attr1.y
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v2, v1, attr1.y
	s_load_dwordx8 s[12:19], s[8:9], 0x400
	s_load_dwordx4 s[20:23], s[8:9], 0x430
	v_mov_b32_e32 v4, v8
	v_mov_b32_e32 v5, v2
	s_and_b32 exec_lo, exec_lo, s0
	s_waitcnt lgkmcnt(0)
	image_sample v[9:12], v[4:5], s[12:19], s[20:23] dmask:0xf dim:SQ_RSRC_IMG_2D
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v1, v12
	v_mov_b32_e32 v2, v11
	v_mov_b32_e32 v8, v10
                                        ; kill: def $vgpr9 killed $vgpr9 killed $vgpr9_vgpr10_vgpr11_vgpr12 killed $exec
	v_mul_f32_e32 v0, v9, v0
	v_mul_f32_e32 v3, v8, v3
	v_mul_f32_e32 v2, v2, v6
	v_mul_f32_e32 v1, v1, v7
                                        ; implicit-def: $sgpr0
                                        ; implicit-def: $sgpr1
                                        ; implicit-def: $sgpr2
                                        ; implicit-def: $sgpr3
	buffer_store_dword v1, off, s[24:27], s6 offset:4 ; 4-byte Folded Spill
	v_mov_b32_e32 v1, v3
	buffer_load_dword v3, off, s[24:27], s6 offset:4 ; 4-byte Folded Reload
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
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 296
; NumSgprs: 30
; NumVgprs: 15
; ScratchSize: 8
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 30
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
