---
id: '657'
title: How to color your bash prompt red in production
languages:
- bash
tags:
---
How to color your bash prompt red in production:


```bash
export RED="\[\e[1;31m\]"
export NORMAL="\[\e[0m\]"

# user@host: ~/directory $
BASE_PROMPT="$RED\u@\h$NORMAL: \w "

# Root prompt should have #
if [[ $EUID == 0 ]] ; then
  export PS1="$BASE_PROMPT#"
else
  export PS1="$BASE_PROMPT\$"
fi
```
    

Put it in **/etc/profile.d/promptcolor.sh** for all users to see the prompt in color.

Script also helps with lowering anxiety levels.

