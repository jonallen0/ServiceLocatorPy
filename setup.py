# -*- coding: utf-8 -*-
import sys
try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

sys.path.insert(0, '.')
from ServiceLocatorPy import __version__


setup(
    name="ServiceLocatorPy",
    version=__version__,
    description="CherryPy based microservice.",
    maintainer="",
    packages=["ServiceLocatorPy"],
    platforms=["any"]
)
