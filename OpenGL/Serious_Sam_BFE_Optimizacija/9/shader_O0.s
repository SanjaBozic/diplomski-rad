	.text
	.section	.AMDGPU.config
	.long	45096
	.long	67
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
	s_mov_b32 s8, SCRATCH_RSRC_DWORD0
	s_mov_b32 s9, SCRATCH_RSRC_DWORD1
	s_mov_b32 s10, -1
	s_mov_b32 s11, 0x31c16000
                                        ; implicit-def: $vcc_hi
                                        ; implicit-def: $vcc_hi
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
	v_interp_p1_f32_e32 v2, v2, attr0.w
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v2, v1, attr0.w
                                        ; implicit-def: $sgpr0
                                        ; implicit-def: $sgpr1
                                        ; implicit-def: $sgpr2
                                        ; implicit-def: $sgpr3
	v_mov_b32_e32 v1, v3
	buffer_store_dword v2, off, s[8:11], s6 offset:4 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, v6
	buffer_load_dword v3, off, s[8:11], s6 offset:4 ; 4-byte Folded Reload
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
; codeLenInByte = 176
; NumSgprs: 14
; NumVgprs: 15
; ScratchSize: 8
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 14
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
