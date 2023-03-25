---
id: '964'
title: Escape and sanitize input and output?
languages:
tags:
---
Thinking about escaping and sanitizing input and output? Read this:
https://security.stackexchange.com/questions/95325/input-sanitization-vs-output-sanitization

Rules:

- Always sanitize output

By sanitizing the output, you can fix issues caused by bugs in the input sanitizer without touching the database.

- Sanitize input, if it makes sense:

For example, if there's a risk that input becomes invalid after sanitization then it's better to store the data raw.

This is also a good idea, if there are multiple output formats and sanitizing the input might break something.
