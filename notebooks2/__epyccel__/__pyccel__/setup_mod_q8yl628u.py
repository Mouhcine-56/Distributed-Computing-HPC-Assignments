from setuptools import Extension, setup
import numpy

extension_mod = Extension("mod_q8yl628u",
		[ r'mod_q8yl628u_wrapper.c' ],
		extra_objects = [r'/home/mouhcine/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__/bind_c_mod_q8yl628u.o',
				r'/home/mouhcine/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__/mod_q8yl628u.o'],
		include_dirs = [r'/home/mouhcine/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__', numpy.get_include()],
		libraries = [r'gfortran'],
		library_dirs = [r'/usr/lib/gcc/x86_64-linux-gnu/9'],
		extra_link_args = [r'-O3',
				r'-fPIC',
				r'-I"/home/mouhcine/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__"'])

setup(name = "mod_q8yl628u", ext_modules=[extension_mod])