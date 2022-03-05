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
//                               OVERWORLD DEBUG MENU
//============================================================================================

define shortcut $000C //Select+Start
define shortcut_change_reader_to_debug $0200 //L
define shortcut_change_reader_to_normal $0100 //R

// Make it so the game skips the text printing portion if a specific shortcut is pressed
org $8039B8A; bl debug_hacks.switch_loading

// Make it so you can change which "layer" reads inputs
org $800B310; bl debug_hacks.switch_change_input_reader_normal
org $800B56A; bl debug_hacks.switch_change_input_reader_running
org $803A102; bl debug_hacks.switch_change_input_reader_debug
org $803A2EA; bl debug_hacks.switch_change_input_reader_debug
org $803A4E6; bl debug_hacks.switch_change_input_reader_debug
org $803A772; bl debug_hacks.switch_change_input_reader_debug
org $803A98A; bl debug_hacks.switch_change_input_reader_debug
org $803ACB2; bl debug_hacks.switch_change_input_reader_debug

// Make it so when you exit the debug menu, it doesn't come back
org $803A122; bl debug_hacks.remove_input_change
org $803A326; bl debug_hacks.remove_input_change
org $803A506; bl debug_hacks.remove_input_change
org $803A7BA; bl debug_hacks.remove_input_change
org $803AA22; bl debug_hacks.remove_input_change
org $803ACD2; bl debug_hacks.remove_input_change

//============================================================================================
//                                    NEW HACK CODE
//============================================================================================

// Now insert the hack code
org $813C100
incsrc debug_hacks.asm



print "End of Current Hacks: ",pc
print "Max:                  0x813C743"
