playable_char_hacks:
define wess_id $7


//===========================================================================================
// Load Duster's menu for Wess
//===========================================================================================
.duster_menu_wess:
push {lr}
push {r1}
bl   $8060FF4                // Call the menu-setting routine for Duster
pop  {r1}                    // Get back the routine
mov  r0,#{wess_id}           // Wess' ID
bl   $8060FF4                // Call the menu-setting routine for Wess
pop  {pc}

//===========================================================================================
// Skip item check for Thief Tools on Wess
//===========================================================================================
.wess_skip_tools_check:
push {lr}
mov  r3,#0xFC
add  r3,r4,r3
ldr  r3,[r3,#0]
ldrb r3,[r3,#0]              // Get character ID
cmp  r3,#{wess_id}           // Is it Wess?
beq  +
bl   $809193C
b    .wess_skip_tools_check_end
+
mov  r0,#1                   // Set the tool to "found"
.wess_skip_tools_check_end:
pop  {pc}