---
id: '803'
title: Switching from Tensorflow to Theano backend in Keras
languages:
tags:
---
- Fixing "ValueError: Negative dimension size caused by subtracting 2 from 1 for 'MaxPool_1' (op: 'MaxPool') with input shapes: [?,1,112,128]."

Change Keras' backend from Tensorflow to Theano:

```
{
  "image_dim_ordering": "tf", 
  "epsilon": 1e-07, 
  "floatx": "float32", 
  "backend": "tensorflow"
}
```

```
{
  "image_dim_ordering": "tf", 
  "epsilon": 1e-07, 
  "floatx": "float32", 
  "backend": "theano"
}
```

- Fixing "ValueError: The shape of the input to "Flatten" is not fully defined (got (0, 7, 512). Make sure to pass a complete "input_shape" or "batch_input_shape" argument to the first layer in your model."

Change Keras' image dimension ordering convention from "tf" (Tensorflow) to "th" (Theano):

```
{
  "image_dim_ordering": "tf", 
  "epsilon": 1e-07, 
  "floatx": "float32", 
  "backend": "theano"
}
```

```
{
  "image_dim_ordering": "th", 
  "epsilon": 1e-07, 
  "floatx": "float32", 
  "backend": "theano"
}
```

### Reference
https://keras.io/backend/

