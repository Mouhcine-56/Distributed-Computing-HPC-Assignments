from setuptools import Extension, setup
import numpy

extension_mod = Extension("mod_ixr6qek7",
		[ r'mod_ixr6qek7_wrapper.c' ],
		extra_objects = [r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__/bind_c_mod_ixr6qek7.o',
				r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__/mod_ixr6qek7.o'],
		include_dirs = [r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__', numpy.get_include()],
		libraries = [r'gfortran'],
		library_dirs = [r'/usr/lib/gcc/x86_64-linux-gnu/9'],
		extra_link_args = [r'-O3',
				r'-fPIC',
				r'-I"/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__"'])

setup(name = "mod_ixr6qek7", ext_modules=[extension_mod])