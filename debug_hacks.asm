debug_hacks:
define state_location $02004111
define current_input_reader $02005C00
define normal_overworld_reader $00
define debug_overworld_reader $0F
// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, load the overworld debug menu.
// ==============================================
.switch_loading:
push {lr}

ldr  r1,=#0x4000130
ldrh r1,[r1,#0]
mvn  r1,r1
ldr  r2,=#{shortcut}         // Is the shortcut being pressed?
and  r1,r2
cmp  r1,r2
bne  +

add  sp,#4
bl   $8039C04                // Special loading
mov  r1,#1

b    .switch_loading_end
+

mov  r12,r0
mov  r2,r12
mov  r1,#0

.switch_loading_end:
ldr  r0,=#{state_location}   // Abuse the EMPTY party member's space
strb r1,[r0,#0]
strb r1,[r0,#1]
pop  {pc}

// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, change the input reading "layer".
// r2 contains which input to respond to.
// ==============================================
.switch_change_input_reader:
push {r0-r1,lr}

ldr  r1,=#{state_location}
ldrb r0,[r1,#0]
cmp  r0,#0                   // Do only if the state is set
beq  .switch_change_input_reader_end
ldrb r0,[r1,#1]              // If it's 
cmp  r0,#1
bne  +
mov  r0,#0
strb r0,[r1,#1]
b    .switch_change_input_reader_success
+
ldr  r1,=#0x2018CCA
ldrh r1,[r1,#0]
and  r1,r2
cmp  r1,r2
bne  .switch_change_input_reader_end

.switch_change_input_reader_success:
ldr  r1,=#{current_input_reader}
ldrb r0,[r1,#0]
cmp  r0,#{normal_overworld_reader}
bne  +
mov  r0,#{debug_overworld_reader}
b    .switch_change_input_reader_store
+
mov  r0,#{normal_overworld_reader}

.switch_change_input_reader_store:
strb r0,[r1,#0]

.switch_change_input_reader_end:
pop  {r0-r1,pc}

// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, change the input reading "layer".
// Reads input while inside the debug mode.
// ==============================================
.switch_change_input_reader_debug:
push {r2,lr}
ldr  r2,=#{shortcut_change_reader_to_normal}
bl   .switch_change_input_reader
mov  r0,#3
and  r0,r1
pop  {r2,pc}

// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, change the input reading "layer".
// Reads input while in the overworld.
// ==============================================
.switch_change_input_reader_normal:
push {r2,lr}
ldr  r2,=#{shortcut_change_reader_to_debug}
bl   .switch_change_input_reader
bl   $802706C
pop  {r2,pc}

// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, change the input reading "layer".
// Reads input while running.
// ==============================================
.switch_change_input_reader_running:
push {r2,lr}
ldr  r2,=#{shortcut_change_reader_to_debug}
bl   .switch_change_input_reader
mov  r0,#0xF0
and  r0,r1
pop  {r2,pc}

// ==============================================
// This hack prevents changing the input reading layer
// if the debug menu was closed.
// ==============================================
.remove_input_change:
push {lr}
mov  r0,#0
ldr  r1,=#{state_location}
strb r0,[r1,#0]
bl   $8039CDC
pop  {pc}
