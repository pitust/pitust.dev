# Step 1 - Making a BIOS Bootblock
So you want to make a bios my lad? Well, let me tell ye: making a bios starts with making a bios bootblock.

A bios bootblock is the first thing that runs. It is placed at `0xf0000`, in real mode (so 16-bit). The instruction pointer is at the so-called _reset vector_, which is the last paragraph of memory. A minimal bootblock can be written like so:

```assembly
bits 16
org 0xf0000

main:
  jmp $

times (0x10000 - 16) - ($ - $$) db 0x00

reset_vector:
    jmp 0xf000:0
    times 11 db 0
```

(assemble with `nasm -fbin path/to/bootblock.s -o path/to/bootblock.bin`)

## Running a BIOS
How do you run a bios? Well, the popular x86 emulator qemu has a flag for that: `-bios`. There are a handful of other useful flags, too:
```
qemu-system-x86_64 -bios path/to/bootblock.bin -debugcon file:/dev/stdout -monitor stdio -M q35
```

To confirm it's working, you can use `info registers` and confirm that `CS` and `EIP` points to `0xf000:0`


## What's next?
In the next part we will get basic I/O and enter protected mode.

[next](/biosdev/step2)

<script src="https://giscus.app/client.js"
        data-repo="pitust/pitust.dev"
        data-repo-id="MDEwOlJlcG9zaXRvcnkzNzI5Mjc0MzE="
        data-category="General"
        data-category-id="MDE4OkRpc2N1c3Npb25DYXRlZ29yeTMzMDYxOTc2"
        data-mapping="og:title"
        data-reactions-enabled="1"
        data-theme="light"
        crossorigin="anonymous"
        async>
</script>
