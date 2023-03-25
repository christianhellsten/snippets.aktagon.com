---
id: '942'
title: Column finding algorithm
languages:
- python
tags:
---
Given text containing left and right aligned data separated by one or more spaces this algorithm will try to detect the columns indices:

```python
def find_columns(text):
    left_aligned_cols = {}
    right_aligned_cols = {}
    lines = text.split("\n")
    line_count = len(lines)

    for line in lines:
        prev_char = None
        # start-of-line is a column delimiter
        if '0' not in left_aligned_cols:
            left_aligned_cols['0'] = 0
        left_aligned_cols['0'] += 1
        for pos, char in enumerate(line):
            # left-aligned column
            if prev_char and prev_char.isspace() and not char.isspace():
                key = str(pos)
                if key not in left_aligned_cols:
                    left_aligned_cols[key] = 0
                left_aligned_cols[key] += 1
            # right-aligned column
            if prev_char and not prev_char.isspace() and char.isspace():
                key = str(pos + 1)
                if key not in right_aligned_cols:
                    right_aligned_cols[key] = 0
                right_aligned_cols[key] += 1
            prev_char = char
        # end-of-line is a column delimiter
        key = str(len(line))
        if key not in right_aligned_cols:
            right_aligned_cols[key] = 0
        right_aligned_cols[key] += 1

    left_aligned_cols = [ int(key) for (key, count) in left_aligned_cols.items() if count == line_count ]
    right_aligned_cols = [ int(key) for (key, count) in right_aligned_cols.items() if count == line_count ]
    column_indices = sorted(set(left_aligned_cols + right_aligned_cols))
    columns = list(map(list, zip(column_indices, column_indices[1:])))
    return columns
```
