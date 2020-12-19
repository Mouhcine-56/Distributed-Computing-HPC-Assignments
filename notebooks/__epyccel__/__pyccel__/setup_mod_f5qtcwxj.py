from setuptools import Extension, setup
import numpy

extension_mod = Extension("mod_f5qtcwxj",
		[ r'mod_f5qtcwxj_wrapper.c' ],
		extra_objects = [r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__/bind_c_mod_f5qtcwxj.o',
				r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__/mod_f5qtcwxj.o'],
		include_dirs = [r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__', numpy.get_include()],
		libraries = [r'gfortran'],
		library_dirs = [r'/usr/lib/gcc/x86_64-linux-gnu/9'],
		extra_link_args = [r'-O3',
				r'-fPIC',
				r'-I"/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__"'])

setup(name = "mod_f5qtcwxj", ext_modules=[extension_mod])