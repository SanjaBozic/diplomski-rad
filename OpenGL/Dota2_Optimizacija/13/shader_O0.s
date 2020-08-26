	.text
	.section	.AMDGPU.config
	.long	45096
	.long	131
	.long	165608
	.long	0
	.long	45100
	.long	0
	.long	165580
	.long	16384
	.long	165584
	.long	61559
	.long	4
	.long	4
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
	s_mov_b32 s0, 0x31016fac
	s_movk_i32 s1, 0x60
	s_mov_b32 s3, 0x8000
	s_mov_b32 s8, s2
	s_mov_b32 s9, s3
	s_mov_b32 s10, s1
	s_mov_b32 s11, s0
	s_buffer_load_dword s0, s[8:11], 0x50
	s_buffer_load_dword s1, s[8:11], 0x54
	s_buffer_load_dword s2, s[8:11], 0x58
	s_buffer_load_dword s3, s[8:11], 0x5c
                                        ; implicit-def: $sgpr5
	s_waitcnt lgkmcnt(0)
	v_writelane_b32 v15, s0, 0
	s_mov_b32 s0, s5
                                        ; implicit-def: $sgpr5
	v_writelane_b32 v15, s1, 1
	s_mov_b32 s1, s5
                                        ; implicit-def: $sgpr5
	v_writelane_b32 v15, s2, 2
	s_mov_b32 s2, s5
                                        ; implicit-def: $sgpr5
	v_writelane_b32 v15, s3, 3
	s_mov_b32 s3, s5
	v_readlane_b32 s5, v15, 0
	v_mov_b32_e32 v0, s5
	v_readlane_b32 s7, v15, 1
	v_mov_b32_e32 v1, s7
	v_readlane_b32 s12, v15, 2
	v_mov_b32_e32 v2, s12
	v_readlane_b32 s13, v15, 3
	v_mov_b32_e32 v3, s13
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v4, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v5, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v6, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v7, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v8, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v9, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v10, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v11, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v12, s14
                                        ; implicit-def: $sgpr14
	v_mov_b32_e32 v13, s14
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 208
; NumSgprs: 17
; NumVgprs: 16
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 17
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
