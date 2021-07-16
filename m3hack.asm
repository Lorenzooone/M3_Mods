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
//                               TEXT SKIPPING SHORTCUT
//============================================================================================

define shortcut $0002 //B

// Make it so the game skips the text printing portion if a specific shortcut is pressed
// 04 00 32 00
org $801D70C
bl   skipping_hacks.text_skipping_dialogue
cmp  r0,#0
bne  +
b    $801D858
+
// 04 00 33 00
org $801D874
bl   skipping_hacks.text_skipping_dialogue
cmp  r0,#0
bne  +
b    $801D9B8
+
// 04 00 B6 00
org $8020792
bl   skipping_hacks.special_text_skipping_dialogue
cmp  r0,#0xFF
bne  +
b    $8020846
+

//============================================================================================
//                                    NEW HACK CODE
//============================================================================================

// Now insert the hack code
org $813C000
incsrc skipping_hacks.asm



print "End of Current Hacks: ",pc
print "Max:                  0x813C743"
