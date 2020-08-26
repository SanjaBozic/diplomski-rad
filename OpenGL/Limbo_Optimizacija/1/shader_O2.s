	.text
	.section	.AMDGPU.config
	.long	47176
	.long	1621884992
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
	s_movk_i32 s3, 0x8000
	s_lshl_b32 s8, s8, 6
	v_mov_b32_e32 v3, s6
	v_mov_b32_e32 v2, s5
	v_mov_b32_e32 v1, s4
	s_load_dwordx4 s[0:3], s[2:3], 0xf0
	v_add_lshl_u32 v0, s8, v0, 4
	v_mov_b32_e32 v4, s7
                                        ; implicit-def: $vcc_hi
	s_waitcnt lgkmcnt(0)
	buffer_store_dwordx4 v[1:4], v0, s[0:3], 0 offen glc slc
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 56
; NumSgprs: 11
; NumVgprs: 5
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 11
; NumVGPRsForWavesPerEU: 5
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
