---
id: '943'
title: Similarity search with Jaccard, Minhash and LSH
languages:
- python
tags:
---
To find the similarity betwen two sets – for example, a document can be seen as a set of words — you can use these algorithms:

- Jaccard similarity

Similarity is calculated as the size of the union of the two sets divided by the size of the intersection of the sets resulting in a number between zero and one. Zero means the sets are completely different and a result of one means they are completely similar.

This algorithm is slow because pairwise comparison is needed. For example, a naive approach could store the Jaccard similarity of 1 000 000 documents by calculating the similarity of each pair and storing the similarity in a database. This would require 1 000 000 * 1 000 000 database rows.

Running time: O(n log(n))
Space complexity: O(n log(n))

- MinHash (with k hash functions)

MinHash leverages hashing and randomness, in a similar way as Bloom filters, to quickly and probabilistically estimate the Jaccard similarity. It does this by generating k signatures for each document.

Pseudo-code example:

```python
a = minhash("some text...")  # signature = [1, 1, 1, 1]
b = minhash(“some text...”)  # signature = [1, 1, 1, 1]
c = minhash(“other text...”) # signature = [2, 1, 1, 1]
```

This algorithm is still slow because pairwise comparison is needed. We only managed to minimize the size of the two sets by using MinHash.

Because this is a probabilistic algorithm we need to account for errors. To achieve 90% accuracy with a 10% error rate, you would need 100 hash functions (1/sqrt(k)).

Hash collisions also need to be minimized.

- Locality-sensitive hashing (LSH)

LSH is a way of optimizing MinHash by binning the many signatures generated with MinHash into buckets.

For example, LSH generates 20 signatures based on 200 hashes by breaking down the MinHash generated signatures into 20 bands – or buckets – each containing 10 MinHash signatures.

There will be false and true negatives.

LSH gives us sub-linear query time.

- MinHash LSH Ensemble

Jaccard similarity works best for small datasets of similar size because the denominator is the union of the two sets.

LSH ensemble is one solution to this issue. For details, see:
http://ekzhu.com/datasketch/lshensemble.html

References:

http://infolab.stanford.edu/~ullman/mmds/ch3.pdf

http://web.eecs.utk.edu/~jplank/plank/classes/cs494/494/notes/Min-Hash/index.html

https://cran.r-project.org/web/packages/textreuse/vignettes/textreuse-minhash.html

https://rdrr.io/cran/textreuse/man/lsh.html

https://maciejkula.github.io/2015/06/01/simple-minhash-implementation-in-python/

http://ekzhu.com/datasketch/lsh.html

https://medium.com/@bassimfaizal/finding-duplicate-questions-using-datasketch-2ae1f3d8bc5c
