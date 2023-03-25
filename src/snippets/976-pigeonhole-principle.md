---
id: '976'
title: Pigeonhole principle
languages:
tags:
---
When working with hashing functions and cryptography the pigeonhole principle is essential knowledge:
https://en.wikipedia.org/wiki/Pigeonhole_principle

> In mathematics, the pigeonhole principle states that if n items are put into m containers, with n > m, then at least one container must contain more than one item.

> For example, given that the population of London is greater than the maximum number of hairs that can be present on a human's head, then the pigeonhole principle requires that there must be at least two people in London who have the same number of hairs on their heads.

This means that in order to create a completely collision-free hashing function, every message would have to have a hashed output of the same length as the input.
