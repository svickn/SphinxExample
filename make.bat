@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=.
set BUILDDIR=_build
set SPHINXPROJ=SphinxExample

if "%1" == "" goto help

REM livehtml and latexpdf were added to this file for this example.
if "%1" == "livehtml" (
 sphinx-autobuild -a -E -b html -B -i ".git\*" -i ".vs\*" %SOURCEDIR% %BUILDDIR%/html %SPHINXOPTS%
 goto end
)

if "%1" == "latexpdf" (
	%SPHINXBUILD% -b latex %SPHINXOPTS% %SOURCEDIR% %BUILDDIR%/latexpdf
	cd %BUILDDIR%/latexpdf
	mingw32-make all-pdf
	cd %~dp0
	echo.
	echo.Build finished; the PDF files are in %BUILDDIR%/latexpdf.
	goto end
)

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%

:end
popd
