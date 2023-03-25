---
id: '583'
title: NER with Python and NLTK
languages:
- python
tags:
---
Code from <https://gist.github.com/322906/90dea659c04570757cccf0ce1e6d26c9d06f9283>


```python
import nltk

def named_entities(text):
	sentences = nltk.sent_tokenize(text)
	tokenized_sentences = [nltk.word_tokenize(sentence) for sentence in sentences]
	tagged_sentences = [nltk.pos_tag(sentence) for sentence in tokenized_sentences]
	chunked_sentences = nltk.batch_ne_chunk(tagged_sentences, binary=True)
	def extract_entity_names(t):
		entity_names = []
		if hasattr(t, 'node') and t.node:
			if t.node == 'NE':
				entity_names.append(' '.join([child[0] for child in t]))
			else:
				for child in t:
					entity_names.extend(extract_entity_names(child))
		return entity_names
	entity_names = []
	for tree in chunked_sentences:
		entity_names.extend(extract_entity_names(tree))
	return set(entity_names)
```
    

