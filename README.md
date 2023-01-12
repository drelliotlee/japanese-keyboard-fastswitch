# japanese-keyboard-fastswitch
I switch often back and forth between the English and Japanese keyboards.
In windows, this switch requires a very unergnomic 4 keystrokes pressed in this sequence: 

`⊞+spacebar`   then   `alt+tilde`

*look at how much your left hand has to reposition to do this sequence*

This autohotkey script makes a single key `CapsLock` toggle back and forth between Japanese and English.

![](defaultsmaller.gif) ![](bettersmaller.gif)

## Lessons Learned
- Some basic autohotkey syntax
- How to screenrecord keystrokes using [Captura](https://mathewsachin.github.io/Captura/)

## Technical Headaches
- Every physical key does not correspond 1-to-1 with a virtual key that windows recognizes! Depending on your active language and keyboard, a physical key can map to different virtual keys.
- Some keys (like the `fn` key) are not re-programmable because they are controlled directly by your hardware's BIOS

## Technologies Practiced
- Autohotkey
- Windows Command Line