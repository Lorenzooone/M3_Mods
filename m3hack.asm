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

// Fix VWF in the English version
org $8008A20; bl debug_hacks.fix_vwf_debug_top
org $8008A28; bl debug_hacks.fix_vwf_debug_bottom
org $8006B70; bl debug_hacks.remove_useless_writes

// Fix position of options
// Page 1
org $803B2E2; bl debug_hacks.blank_line_wrapper_0
org $803B2F2; bl debug_hacks.print_proper_map_name; b $803B334
org $803B336; bl debug_hacks.fix_odd_end_wrapper_special_0
org $803B340; bl debug_hacks.blank_line_wrapper_1
org $803B362; bl debug_hacks.force_text_into_pos_wrapper_1
org $803B368; bl debug_hacks.fix_odd_end_wrapper
org $803B374; bl debug_hacks.blank_line_wrapper_2
org $803B394; bl debug_hacks.force_text_into_pos_wrapper_2
org $803B39A; bl debug_hacks.fix_odd_end_wrapper
// Page 2
org $803B3D6; bl debug_hacks.blank_line_wrapper_0
org $803B3EE; bl debug_hacks.force_text_into_pos_wrapper_0
org $803B3F4; bl debug_hacks.fix_odd_end_wrapper_alt
org $803B400; bl debug_hacks.blank_line_wrapper_1
org $803B422; bl debug_hacks.force_text_into_pos_wrapper_1
org $803B428; bl debug_hacks.fix_odd_end_wrapper
org $803B434; bl debug_hacks.blank_line_wrapper_2
org $803B454; bl debug_hacks.force_text_into_pos_wrapper_2
org $803B45A; bl debug_hacks.fix_odd_end_wrapper
// Page 3
org $803B486; bl debug_hacks.blank_line_wrapper_0
org $803B4A8; bl debug_hacks.force_text_into_pos_wrapper_0
org $803B4AE; bl debug_hacks.fix_odd_end_wrapper
org $803B4BA; bl debug_hacks.blank_line_wrapper_1
org $803B4D2; bl debug_hacks.force_text_into_pos_wrapper_1
org $803B4D8; bl debug_hacks.fix_odd_end_wrapper
org $803B4E4; bl debug_hacks.blank_line_wrapper_2
org $803B4EA; bl debug_hacks.fix_odd_end_wrapper
// Page 4
org $803B50E; bl debug_hacks.blank_line_wrapper_0
org $803B514; bl debug_hacks.fix_odd_end_wrapper
org $803B520; bl debug_hacks.blank_line_wrapper_1
org $803B526; bl debug_hacks.fix_odd_end_wrapper
org $803B532; bl debug_hacks.blank_line_wrapper_2
org $803B538; bl debug_hacks.fix_odd_end_wrapper
// Page 5
org $803B556; bl debug_hacks.blank_line_wrapper_0
org $803B55C; bl debug_hacks.fix_odd_end_wrapper
org $803B568; bl debug_hacks.blank_line_wrapper_1
org $803B56E; bl debug_hacks.fix_odd_end_wrapper
org $803B57A; bl debug_hacks.blank_line_wrapper_2
org $803B580; bl debug_hacks.fix_odd_end_wrapper
// Page 6
org $803B59E; bl debug_hacks.blank_line_wrapper_0
org $803B5A4; bl debug_hacks.fix_odd_end_wrapper
org $803B5B0; bl debug_hacks.blank_line_wrapper_1
org $803B5B6; bl debug_hacks.fix_odd_end_wrapper

//============================================================================================
//                                    NEW HACK CODE
//============================================================================================

// Now insert the hack code
org $813C100
incsrc debug_hacks.asm



print "End of Current Hacks: ",pc
print "Max:                  0x813C743"
