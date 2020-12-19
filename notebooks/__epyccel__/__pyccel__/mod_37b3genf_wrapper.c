#define PY_SSIZE_T_CLEAN
#define NPY_NO_DEPRECATED_API NPY_1_19_API_VERSION
#include <stdio.h>
#include <stdlib.h>
#include <Python.h>
#include <numpy/arrayobject.h>

long solve_1d_linearconv_pyccel(int n0_u, double *u, int n0_un, double *un, long nt, long nx, double dt, double dx, double c);

/*........................................*/



/*........................................*/

/*........................................*/
PyObject *solve_1d_linearconv_pyccel_wrapper(PyObject *self, PyObject *args, PyObject *kwargs)
{

    PyArrayObject *u;
    PyArrayObject *un;
    long nt;
    long nx;
    double dt;
    double dx;
    double c;
    long Out_0001;
    PyObject *result;
    static char *kwlist[] = {
        "u",
        "un",
        "nt",
        "nx",
        "dt",
        "dx",
        "c",
        NULL
    };

    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!O!llddd", kwlist, &PyArray_Type, &u, &PyArray_Type, &un, &nt, &nx, &dt, &dx, &c))
    {
        return NULL;
    }
    if (PyArray_NDIM(u) != 1)
    {
        PyErr_SetString(PyExc_TypeError, "u must have rank 1");
        return NULL;
    }
    if (PyArray_TYPE(u) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(u), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "u must be double");
        return NULL;
    }
    if (PyArray_NDIM(un) != 1)
    {
        PyErr_SetString(PyExc_TypeError, "un must have rank 1");
        return NULL;
    }
    if (PyArray_TYPE(un) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(un), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "un must be double");
        return NULL;
    }
    Out_0001 = solve_1d_linearconv_pyccel(PyArray_DIM(u, 0), PyArray_DATA(u), PyArray_DIM(un, 0), PyArray_DATA(un), nt, nx, dt, dx, c);
    result = Py_BuildValue("l", Out_0001);
    return result;
}
/*........................................*/

static PyMethodDef mod_37b3genf_methods[] = {
    {
        "solve_1d_linearconv_pyccel",
        (PyCFunction)solve_1d_linearconv_pyccel_wrapper,
        METH_VARARGS | METH_KEYWORDS,
        ""
    },
    { NULL, NULL, 0, NULL}
};

/*........................................*/

static struct PyModuleDef mod_37b3genf_module = {
    PyModuleDef_HEAD_INIT,
    /* name of module */
    "mod_37b3genf",
    /* module documentation, may be NULL */
    NULL,
    /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
    -1,
    mod_37b3genf_methods
};

/*........................................*/

PyMODINIT_FUNC PyInit_mod_37b3genf(void)
{
    PyObject *m;

    import_array();

    m = PyModule_Create(&mod_37b3genf_module);
    if (m == NULL) return NULL;

    return m;
}
