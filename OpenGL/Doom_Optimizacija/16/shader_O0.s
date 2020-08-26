	.text
	.section	.AMDGPU.config
	.long	45096
	.long	259
	.long	165608
	.long	8192
	.long	45100
	.long	0
	.long	165580
	.long	16386
	.long	165584
	.long	61559
	.long	4
	.long	9
	.long	8
	.long	10
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s28, SCRATCH_RSRC_DWORD0
	s_mov_b32 s29, SCRATCH_RSRC_DWORD1
	s_mov_b32 s30, -1
	s_mov_b32 s31, 0x31c16000
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
	v_interp_p1_f32_e32 v0, v2, attr1.x
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v0, v1, attr1.x
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v3, v2, attr1.y
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v3, v1, attr1.y
	s_mov_b32 s1, s3
	s_load_dwordx8 s[12:19], s[8:9], 0x400
	s_load_dwordx4 s[20:23], s[8:9], 0x430
	v_mov_b32_e32 v4, v0
	v_mov_b32_e32 v5, v3
	v_mov_b32_e32 v7, v5
	v_mov_b32_e32 v6, v4
	s_waitcnt lgkmcnt(0)
	image_sample v8, v[6:7], s[12:19], s[20:23] dmask:0x1 dim:SQ_RSRC_IMG_2D
	v_nop
	s_load_dwordx8 s[12:19], s[8:9], 0x440
	s_load_dwordx4 s[20:23], s[8:9], 0x470
	v_mov_b32_e32 v7, v5
	v_mov_b32_e32 v6, v4
	s_waitcnt lgkmcnt(0)
	image_sample v9, v[6:7], s[12:19], s[20:23] dmask:0x1 dim:SQ_RSRC_IMG_2D
	v_nop
	s_load_dwordx8 s[12:19], s[8:9], 0x480
	s_load_dwordx4 s[20:23], s[8:9], 0x4b0
	s_waitcnt lgkmcnt(0)
	image_sample v10, v[4:5], s[12:19], s[20:23] dmask:0x1 dim:SQ_RSRC_IMG_2D
	s_mov_b32 s7, 0x31016fac
	s_mov_b32 s10, 32
	s_mov_b32 s11, 0x8000
	v_nop
	s_mov_b32 s20, s2
	s_mov_b32 s21, s11
	s_mov_b32 s22, s10
	s_mov_b32 s23, s7
	s_mov_b64 s[26:27], s[22:23]
	s_mov_b64 s[24:25], s[20:21]
	s_buffer_load_dword s2, s[20:23], 0x0
	s_mov_b32 s7, 0
	s_waitcnt lgkmcnt(0)
	v_cmp_nlt_f32_e64 s2, s7, s2
	s_mov_b32 s7, 1.0
	s_and_b32 vcc_lo, exec_lo, s2
	v_mov_b32_e32 v11, 1.0
	v_writelane_b32 v15, s0, 0
	buffer_store_dword v14, off, s[28:31], s6 offset:4 ; 4-byte Folded Spill
	v_writelane_b32 v15, s5, 1
	v_writelane_b32 v15, s4, 2
	v_writelane_b32 v15, s3, 3
	buffer_store_dword v2, off, s[28:31], s6 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v1, off, s[28:31], s6 offset:12 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[28:31], s6 offset:16 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[28:31], s6 offset:20 ; 4-byte Folded Spill
	v_writelane_b32 v15, s1, 4
	s_waitcnt vmcnt(2)
	buffer_store_dword v8, off, s[28:31], s6 offset:24 ; 4-byte Folded Spill
	s_waitcnt vmcnt(1)
	buffer_store_dword v9, off, s[28:31], s6 offset:28 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v10, off, s[28:31], s6 offset:32 ; 4-byte Folded Spill
	v_writelane_b32 v15, s24, 5
	v_writelane_b32 v15, s25, 6
	v_writelane_b32 v15, s26, 7
	v_writelane_b32 v15, s27, 8
	buffer_store_dword v11, off, s[28:31], s6 offset:36 ; 4-byte Folded Spill
	s_cbranch_vccnz BB0_2
; %bb.1:                                ; %if1
	s_movk_i32 s0, 0x8000
	v_readlane_b32 s1, v15, 3
	s_mov_b32 s2, s1
	s_mov_b32 s3, s0
	s_load_dwordx8 s[8:15], s[2:3], 0x4c0
	v_readlane_b32 s4, v15, 4
	s_mov_b32 s2, s4
	s_mov_b32 s3, s0
	s_load_dwordx4 s[16:19], s[2:3], 0x4f0
	buffer_load_dword v0, off, s[28:31], s6 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v1, v0
	buffer_load_dword v3, off, s[28:31], s6 offset:20 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v2, v3
	s_waitcnt lgkmcnt(0)
	image_sample v4, v[1:2], s[8:15], s[16:19] dmask:0x1 dim:SQ_RSRC_IMG_2D
	s_waitcnt vmcnt(0)
	buffer_store_dword v4, off, s[28:31], s6 offset:36 ; 4-byte Folded Spill
BB0_2:                                  ; %endif1
	v_readlane_b32 s0, v15, 0
	s_and_b32 exec_lo, exec_lo, s0
	buffer_load_dword v0, off, s[28:31], s6 offset:36 ; 4-byte Folded Reload
	v_readlane_b32 s1, v15, 1
	s_mov_b32 m0, s1
	buffer_load_dword v1, off, s[28:31], s6 offset:8 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_interp_p1_f32_e32 v2, v1, attr0.x
	s_mov_b32 m0, s1
	buffer_load_dword v3, off, s[28:31], s6 offset:12 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_interp_p2_f32_e32 v2, v3, attr0.x
	s_mov_b32 m0, s1
	v_interp_p1_f32_e32 v4, v1, attr0.y
	s_mov_b32 m0, s1
	v_interp_p2_f32_e32 v4, v3, attr0.y
	s_mov_b32 m0, s1
	v_interp_p1_f32_e32 v5, v1, attr0.z
	s_mov_b32 m0, s1
	v_interp_p2_f32_e32 v5, v3, attr0.z
	s_mov_b32 m0, s1
	v_interp_p1_f32_e32 v6, v1, attr0.w
	s_mov_b32 m0, s1
	v_interp_p2_f32_e32 v6, v3, attr0.w
	v_mov_b32_e32 v7, 0xbf5ee340
	s_mov_b32 s2, 0x3fcc4300
	buffer_load_dword v8, off, s[28:31], s6 offset:28 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v7, s2, v8
	v_mov_b32_e32 v9, 0x3f079ac0
	s_mov_b32 s2, 0xbf504000
	v_fmac_f32_e32 v9, s2, v8
	s_mov_b32 s2, 0xbec86c00
	buffer_load_dword v10, off, s[28:31], s6 offset:32 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v9, s2, v10
	v_mov_b32_e32 v11, 0xbf8a7420
	s_mov_b32 s2, 0x40012400
	v_fmac_f32_e32 v11, s2, v10
	s_mov_b32 s2, 0x3f950200
	buffer_load_dword v12, off, s[28:31], s6 offset:24 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v7, s2, v12
	v_fmac_f32_e32 v9, s2, v12
	v_fmac_f32_e32 v11, s2, v12
	v_mul_f32_e32 v2, v7, v2
	v_mul_f32_e32 v4, v9, v4
	v_mul_f32_e32 v5, v11, v5
	v_readlane_b32 s8, v15, 5
	v_readlane_b32 s9, v15, 6
	v_readlane_b32 s10, v15, 7
	v_readlane_b32 s11, v15, 8
	s_buffer_load_dword s2, s[8:11], 0x10
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v2, s2, v2
	v_mul_f32_e32 v1, s2, v4
	v_mul_f32_e32 v4, s2, v5
	v_mul_f32_e32 v3, v0, v6
                                        ; implicit-def: $sgpr0
                                        ; implicit-def: $sgpr1
                                        ; implicit-def: $sgpr2
                                        ; implicit-def: $sgpr3
	v_readlane_b32 s4, v15, 2
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v2, v4
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
	buffer_load_dword v14, off, s[28:31], s6 offset:4 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 952
; NumSgprs: 34
; NumVgprs: 16
; ScratchSize: 40
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 34
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
