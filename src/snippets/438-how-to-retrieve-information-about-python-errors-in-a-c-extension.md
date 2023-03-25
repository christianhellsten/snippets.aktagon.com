---
id: '438'
title: How to retrieve information about Python errors in a C extension
languages:
- python
tags:
---

```python
result = PyEval_CallObject(tmp_callback, args);
    // result == NULL means an error occured
    if (PyErr_Occurred()) {
        PyObject* ptype;
        PyObject* pvalue;
        PyObject* ptraceback;
        PyErr_Fetch(&ptype, &pvalue, &ptraceback);
        printf("Error occurred on line: %d", ((PyTracebackObject*)ptraceback)->tb_lineno);
        // Restore exception instead of disposing of it
        PyErr_Restore(ptype, pvalue, ptraceback);
        PyErr_Print();

        Py_XDECREF(ptype);
        Py_XDECREF(pvalue);
        Py_XDECREF(ptraceback);
    }
```
    

via <http://www.ragestorm.net/tutorial?id=21>

