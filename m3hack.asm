arch gba.thumb

//============================================================================================
//                                     DATA FILES
//============================================================================================

// relocate the big sound clip to the end of the ROM, freeing up hack space for us
org $8119C64; dd $9F92600
org $811B734; dd $9F92600
org $811F6DC; dd $9F92600
org $811FA90; dd $9F92600
org $812030C; dd $9F92600
org $9F92600; incbin sound_relocate_dump.bin

//============================================================================================
//                                    NEW HACK CODE
//============================================================================================

// Now insert the hack code
org $813C000
//incsrc general_hacks.asm



print "End of Current Hacks: ",pc
print "Max:                  0x813C743"
