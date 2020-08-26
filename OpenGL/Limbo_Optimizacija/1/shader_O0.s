	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621885057
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
	s_mov_b32 s12, s4
	s_mov_b32 s13, s5
	s_mov_b32 s14, s6
	s_mov_b32 s15, s7
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v4, v1
	v_mov_b32_e32 v5, v2
	s_movk_i32 s0, 0x8000
	s_mov_b32 s10, s2
	s_mov_b32 s11, s0
                                        ; kill: def $vgpr3_vgpr4_vgpr5 killed $vgpr3_vgpr4_vgpr5 killed $exec
                                        ; kill: def $sgpr16_sgpr17_sgpr18_sgpr19 killed $sgpr12_sgpr13_sgpr14_sgpr15
	s_mov_b32 s0, 6
	s_lshl_b32 s0, s8, s0
	s_mov_b32 s1, 4
	v_add_lshl_u32 v0, s0, v0, s1
	s_load_dwordx4 s[16:19], s[10:11], 0xf0
	s_mov_b32 s0, 0
	v_mov_b32_e32 v6, s12
	v_mov_b32_e32 v7, s13
	v_mov_b32_e32 v8, s14
	v_mov_b32_e32 v9, s15
	s_waitcnt lgkmcnt(0)
	buffer_store_dwordx4 v[6:9], v0, s[16:19], s0 offen glc slc
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 104
; NumSgprs: 22
; NumVgprs: 10
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 22
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
