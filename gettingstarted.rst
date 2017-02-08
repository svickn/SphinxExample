===================================
Getting Started with Sphinx Example
===================================
Sphinx Example is built using Sphinx and reStructuredText, and then exported as separate PDF documents by user role.

.. contents:: Sections:
   :local:
   :depth: 1

------------
Sphinx Example Requirements
------------
The following are required to work with Sphinx Example:

- Windows PowerShell
- Git: `Git for Windows <https://git-scm.com/download/win>`__
- Git Credential Manager: `Git Credential Manager for Windows <https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest>`__ 
- Python 2.X (2.7.9 or above, but not 3.X): `Python Releases for Windows <https://www.python.org/downloads/windows/>`__

.. warning:: Both the Python install directory and the Python scripts directory need to be added to your ``PATH`` environment variable. For example, if you install Python into the c:\\python27 directory, you would add ``c:\python27;c:\python27\scripts`` to your ``PATH`` environment variable.

LaTex PDF Requirements
^^^^^^^^^^^^^^^^^^^^^^
If you plan on making latexpdf output, install chocolatey then run the following commands from a admin powershell window: 

- Chocolatey (NuGet-like tool for installing software on Windows): `Installing Chocolatey <https://chocolatey.org/install>`__

.. code-block:: sourcecode
    
    choco install mingw
    choco install miktex

Helpful Tools
^^^^^^^^^^^^^
The following aren't required but may help make life a little easier:

- Visual Studio Code IDE: `Visual Studio Code <https://code.visualstudio.com/Download>`__
- VS Code reStructuredText extension: `reStructuredText <https://marketplace.visualstudio.com/items?itemName=lextudio.restructuredtext>`__

----------------
Cloning the repo
----------------
Sphinx Example is hosted at GitHub as a Git repo and will require Git to download.

.. code-block:: sourcecode

    git clone https://github.com/svickn/SphinxExample.git

----------------
Building Sphinx Example
----------------
Once you have the Sphinx Example repo cloned the following instructions will walk you through getting Sphinx Example running and ready.

1. Open command prompt and navigate to the directory where Sphinx Example was installed. This should be the directory that has the *conf.py* and *make.bat* files.
2. Run the following commands to install the python required packages via pip.

.. code-block:: sourcecode

    python -m pip install -U pip setuptools
    pip install -r requirements.txt

3. If you've installed Visual Studio Code, you can open the cloned repo folder and it will automatically detect the git source control.

To check and see that everything is in place, the following command should build the html output and open up your default browser to the documentation.

.. code-block:: sourcecode

    ./make livehtml

make.bat commands
^^^^^^^^^^^^^^^^^

======================= =======================================================
 Command                 Description
======================= =======================================================
./make livehtml          Live updating preview of html while changes are made.
./make html              Generates the html output once (not live)
./make latexpdf          Generate as LaTeX PDF output.
======================= =======================================================