---
id: '874'
title: My Mac won't go to sleep
languages:
- bash
tags:
---
If your Mac won't go to sleep, try this:

```bash
pmset -g assertions
```

Check the output for details on which processes and voodo magic is keeping your iMac up all night:

```bash
Listed by owning process:
   pid 4627(cloudd)...
Idle sleep preventers: IODisplayWrangler
```

Things you can try:
- Resetting the printing system (CTRL+click in the left pane of the Printers and scanners settings)
- Unplugging external devices (USB, bluetooth, etc)
- Voodoo

References:

https://discussions.apple.com/thread/7256162

https://www.reddit.com/r/applehelp/comments/43ks7u/macbook_wont_go_to_sleep_hidd_preventing_sleep/

https://apple.stackexchange.com/questions/307151/significance-of-iodisplaywrangler-in-power-management-assertions
