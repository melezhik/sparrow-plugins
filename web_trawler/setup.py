import setuptools

from web_trawler import version

setuptools.setup(
    name="web_trawler",
    version=version.__version__,
    description="Trawl web pages for files to download",
    long_description=open("README.rst").read(),
    url="https://gitlab.com/dlab-indecol/web_trawler",
    author="Gorm Roedder",
    author_email="gormroedder@gmail.com",
    license="GPLv3",
    packages=["web_trawler"],
    package_data={"web_trawler": ["../LICENSE", "CHANGELOG.rst"]},
    install_requires=[],
    entry_points={'console_scripts': ['web_trawler = web_trawler:main']},
)
