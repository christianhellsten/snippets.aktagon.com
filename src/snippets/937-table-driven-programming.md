---
id: '937'
title: Table-driven Programming
languages:
- python
tags:
---
You can use if statements to run a function when the state of your application matches specific criteria.

However, if statements don't scale as they are hard to understand and maintain:

```python
if state_x and state_y and state_z:
    do_xyz()

if state_x and state_z:
    do_xz()

if state_x and state_y and not state_z:
    do_xy_not_z()
```

Table-driven programming is an alternative that sometimes is easier to maintain:

```python
rules = (
    # x, y, z, function
    (True, True, True, do_xyz),
    (True, True, False, do_xy_not_z),
    (True, False, True, do_xz),
    (True, True, True, do_xz),
)
for rule in rules:
    rule_x = rule[0]
    rule_y = rule[1]
    rule_z = rule[2]
    doit = rule[3]
    if rule_x == state_x and rule_y == state_y and rule_z == state_z:
        doit()
    else:
        print("Skipping")
```

Or, more succinctly:

```python
def matching_rules(rules, params):
    for criterion, func in rules:
        if all(params[ix] == criteria for ix, criteria in enumerate(criterion)):
            yield func

# The table of rules
rules = (
    # x, y, z, function
    ((True, True, True), do_xyz),
    ((True, True, False), do_xy_not_z),
    ((True, False, True), do_xz),
    (True, True, True, do_xz),
)
params = (state_x, state_y, state_z)
for func in matching_rules(rules, params):
    func()
```

In summary, a function is run only when the criteria match.

Pattern matching is also an alternative:
https://www.python.org/dev/peps/pep-0635/

However, the first-to-match rule requires the order to be correct and prevents multiple function calls.

State machines and Prolog are also options...
