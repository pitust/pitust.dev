# Step 2 - Protected mode and the first driver
Entering protected mode requires three things:
 - Loading a valid GDT with 32-bit entries
 - Enabling protection in `cr0`
 - Loading 32-bit segment selectors

## Loading a valid GDT with 32-bit entries
This task is rather straightforward, you need to place three selectors into memory (one null and two qwords of data you can just copy-paste), create a GDT pointer, and load it via `lgdt`.

The actual selectors are `0x00cf9a000000ffff` and `0x00cf93000000ffff`.

**IMPORTANT**: Another important thing is that you _must_ load the address through a GPR, or your GDT will be loaded from 0 (due to instruction encodings and some such)

Armed with this knowledge, you can now load a GDT. `info registers` shows the GDTR as well, so you can use it to confirm that you loaded it successfully.

## Enabling protection in cr0
This is rather simple, you need to set `cr0` to `1 | old cr0`. Keep in mind cr0 has some contents on startup (!).

## Loading 32-bit segment selectors
You need to far jump (`jmp 08h:protected_mode`), then set `ds`, `ss`, `es`, `fs` and `gs` to 0x10. Make sure to place a `bits 32` before the protected mode entrypoint! (note that moving to selectors must happen through a register, usually `ax`)

## The first driver
The first driver you want to write is for the ISA debugcon device - it's piss easy, but it's really useful.

The debugcon is accessed by writing a byte to the appropriate IO port, using [`out`](https://www.felixcloutier.com/x86/out).

The port is configurable, but the default it is `0xe9`

## What's next?
In the next part we will get into D code, and write a basic printf function.

<!-- [next](/biosdev/step3) -->

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
