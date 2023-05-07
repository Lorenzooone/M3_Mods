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
//                                 WESS PLAYABLE STUFF
//============================================================================================

// Set up the battle menu so it uses Duster's
org $8060FB0; bl playable_char_hacks.duster_menu_wess

// Make Thief Tools always appear for Wess
org $809C98A; bl playable_char_hacks.wess_skip_tools_check
org $809C9BE; bl playable_char_hacks.wess_skip_tools_check
org $809C9F2; bl playable_char_hacks.wess_skip_tools_check
org $809CA26; bl playable_char_hacks.wess_skip_tools_check
org $809CA5A; bl playable_char_hacks.wess_skip_tools_check
org $809CA8E; bl playable_char_hacks.wess_skip_tools_check

// Change colour of Wess' icon in the overworld menus
org $9B99964; incbin gfx_wess_menu.bin

// Change Wess' palette and point to it
define wess_palette_new_location $9FD7E00
org {wess_palette_new_location}; incbin gfx_wess_palette.bin
org $9C91338; dd {wess_palette_new_location}-$9C90960; dw $0200

// Change Wess' bottom arrangement and point to it
define wess_arrangement_new_location $9FD7D50
org {wess_arrangement_new_location}; incbin gfx_wess_arrangement.bin
org $9C91E40; dd {wess_arrangement_new_location}-$9C90960; dw $00B0

// Add Wess' battle icons
org $9C98D08; incbin gfx_battle_icons.bin

// Make Wess playable outside of battle and in-battle
org $80CCE80; dw $0100

// Change Wess' sound distribution table so it supports multiple sounds
org $8112EE0; db $20; db $18; db $12; db $0C; db $09; db $05

//============================================================================================
//                                 BRONSON PLAYABLE STUFF
//============================================================================================

// Change to Bronson's icon in the overworld menus
org $9B9A564; incbin gfx_bronson_menu.bin

// Change Bronson's palette and point to it
org $9C91370; dd {wess_palette_new_location}-$9C90960; dw $0200
org $9CEC088; dw $3DED
org $9CEC288; dw $3DED
org $9CEC488; dw $3DED
org $9CEC688; dw $3DED
org $9CEC888; dw $3DED
org $9CECA88; dw $3DED

// Change Bronson's bottom arrangement and point to it
define bronson_arrangement_new_location $9FD7CA0
org {bronson_arrangement_new_location}; incbin gfx_bronson_arrangement.bin
org $9C91E48; dd {bronson_arrangement_new_location}-$9C90960; dw $00B0

// Make Bronson playable outside of battle and in-battle
org $80CCFC4; dw $0100

//============================================================================================
//                                    NEW HACK CODE
//============================================================================================

// Now insert the hack code
org $813C200
incsrc playable_char_hacks.asm



print "End of Current Hacks: ",pc
print "Max:                  0x813C743"
