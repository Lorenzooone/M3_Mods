skipping_hacks:

// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, skip printing text.
// ==============================================
.text_skipping_dialogue:
push {lr}

ldr  r0,=#0x2018CCA
ldrh r0,[r0,#0]
ldr  r1,=#{shortcut}         // Is the shortcut being pressed?
and  r0,r1
cmp  r0,r1
bne  +

mov  r0,#0                   // End the routine with a signal
b    .text_skipping_dialogue_end
+

mov  r0,r7
mov  r1,#1
bl   $8021914
ldr  r0,=#0x2005C00

.text_skipping_dialogue_end:
pop  {pc}

// ==============================================
// This hack checks if a specific shortcut is being pressed.
// If it is, skip printing special text.
// ==============================================
.special_text_skipping_dialogue:
push {lr}
mov  r4,r0

ldr  r0,=#0x2018CCA
ldrh r0,[r0,#0]
ldr  r1,=#{shortcut}         // Is the shortcut being pressed?
and  r0,r1
cmp  r0,r1
bne  +

mov  r0,#0xFF                // End the routine with a signal
b    .special_text_skipping_dialogue_end
+

mov  r0,r4
mov  r1,#1
bl   $8021914
lsl  r0,r0,#0x10

.special_text_skipping_dialogue_end:
pop  {pc}