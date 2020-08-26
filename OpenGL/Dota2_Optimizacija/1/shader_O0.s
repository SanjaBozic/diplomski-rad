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
                                        ; implicit-def: $vcc_hi
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s0, s8
	s_mov_b32 s1, s9
	s_mov_b32 s2, s10
	s_mov_b32 s3, s11
	s_mov_b32 s16, s4
	s_mov_b32 s17, s5
	s_mov_b32 s18, s6
	s_mov_b32 s19, s7
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v4, v1
	v_mov_b32_e32 v5, v2
                                        ; kill: def $vgpr3_vgpr4_vgpr5 killed $vgpr3_vgpr4_vgpr5 killed $exec
                                        ; kill: def $sgpr20_sgpr21_sgpr22_sgpr23 killed $sgpr0_sgpr1_sgpr2_sgpr3
                                        ; kill: def $sgpr20_sgpr21_sgpr22_sgpr23 killed $sgpr16_sgpr17_sgpr18_sgpr19
	s_mov_b32 s4, 6
	s_lshl_b32 s4, s12, s4
	s_mov_b32 s5, 4
	v_add_lshl_u32 v0, s4, v0, s5
	s_mov_b32 s4, 0
	v_mov_b32_e32 v6, s16
	v_mov_b32_e32 v7, s17
	v_mov_b32_e32 v8, s18
	v_mov_b32_e32 v9, s19
	buffer_store_dwordx4 v[6:9], v0, s[0:3], s4 offen glc slc
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 96
; NumSgprs: 26
; NumVgprs: 10
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 26
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
