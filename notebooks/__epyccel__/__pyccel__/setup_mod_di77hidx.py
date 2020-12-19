from setuptools import Extension, setup
import numpy

extension_mod = Extension("mod_di77hidx",
		[ r'mod_di77hidx_wrapper.c' ],
		extra_objects = [r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__/bind_c_mod_di77hidx.o',
				r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__/mod_di77hidx.o'],
		include_dirs = [r'/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__', numpy.get_include()],
		libraries = [r'gfortran'],
		library_dirs = [r'/usr/lib/gcc/x86_64-linux-gnu/9'],
		extra_link_args = [r'-O3',
				r'-fPIC',
				r'-I"/home/mouhcine/Bureau/githup/__epyccel__/__pyccel__"'])

setup(name = "mod_di77hidx", ext_modules=[extension_mod])