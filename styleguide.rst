=======================
Sphinx Example Style Standards 
=======================

This document provides an overview of the standards that should be used for contributions to the Sphinx Example project. It has been derived from the `ASP.NET Docs Style Guide <https://docs.asp.net/en/latest/contribute/style-guide.html>`__ and can serve, itself, as a template when contributing to Sphinx Example.

.. contents:: Sections:
   :local:
   :depth: 1

-------
Folders
-------
Folders in Sphinx Example are used to organize groups of related topics.

The common folder
^^^^^^^^^^^^^^^^^
The top level common folder is intended for topics or sections within topics that can be shared between documents.

The _static folder
^^^^^^^^^^^^^^^^^^
The _static folder is intended for any static content like html, css, or images.

---------
Filenames
---------
Files should be named based on the following convention:

- When necessary, prefix the file name with the development area like authorization-create.rst
- Lowercase letters or hyphens only

.. warning:: If many files start to share the same prefix it could be a sign that a new folder should be added to further delineate the documentation.

---------------
Document Styles
---------------
Documents should be submitted as individual text files with a .rst extension. Authors should be sure they are familiar with the `Sphinx Style Guide <http://documentation-style-guide-sphinx.readthedocs.org/en/latest/style-guide.html>`__, but where there are disagreements, this document takes precedence.

Documents should typically begin with a brief abstract describing what will be covered, followed by a bulleted list of topics, if appropriate. If the article has associated sample files, a link to the samples should be included following this bulleted list.

Headings
^^^^^^^^
Typically documents will use at most 3 levels of headings. The title of the document is the highest level heading and must appear on lines 1-2 of the document.

- **=** with overline, for document titles
- **-** with overline, for sections
- **^**, for subsections

Title capitalization should follow `APA guidelines <http://blog.apastyle.org/apastyle/2012/03/title-case-and-sentence-case-capitalization-in-apa-style.html>`__.

- **Title Case**, for document titles and sections
- **Sentence case**, for subsections


.. code-block:: rst

    ========================
    This is a Document Title
    ========================

    -------------------------
    This is a Section Heading
    -------------------------

    This is a subsection heading
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-----------------------
ReStructuredText Syntax
-----------------------

The following ReStructuredText elements are commonly used in ASP.NET documentation articles. Note that **indentation and blank lines are significant!**

Inline Markup
^^^^^^^^^^^^^

Surround text with:

- One asterisk for \*emphasis\* (*italics*)
- Two asterisks for \**strong emphasis\** (**bold**)
- Two backticks for \``code samples``\ (an ``<html>`` element)

.. note:: Inline markup cannot be nested, nor can surrounded content start or end with whitespace (``* foo*`` is wrong).

Escaping is done using the ``\`` backslash.

Format specific items using these rules:

- *Italics* (surround with \*)
  - Files, folders, paths (for long items, split onto their own line)
  - New terms
  - URLs (unless rendered as links, which is the default)
- **Strong** (surround with \**)
  - UI elements
- ``Code Elements`` (surround with \``)
  - Classes and members
  - Command-line commands
  - Database table and column names
  - Language keywords

Links
^^^^^

Links should use HTTPS when possible. Inline hyperlinks are formatted like this:

.. code-block:: rst

  Learn more about `ASP.NET <https://www.asp.net>`_.

Learn more about `ASP.NET <https://www.asp.net>`_.

Surround the link text with backticks. Within the backticks, place the target in angle brackets, and ensure there is a space between the end of the link text and the opening angle bracket. Follow the closing backtick with an underscore.

In addition to URLs, documents and document sections can also be linked by name:

.. code-block:: rst

  For example, here is a link to the `Inline Markup`_ section, above.

For example, here is a link to the `Inline Markup`_ section, above.

Any element that is rendered as a link should not have any additional formatting or styling.

Lists
^^^^^

Lists can be started with a ``-`` or ``*`` character:

.. code-block:: rst

  - This is one item
  - This is a second item

Numbered lists can start with a number, or they can be auto numbered by starting each item with the \# character. Please use the \# syntax.

.. code-block:: rst

  1. Numbered list item one.(don't use numbers)
  2. Numbered list item two.(don't use numbers)

  #. Auto-numbered one.
  #. Auto-numbered two.

Source Code
^^^^^^^^^^^

Source code is very commonly included in these articles. Images should never be used to display source code. Prefer ``literalinclude`` for most code samples. Reserve ``code-block`` for small snippets that are not included in the sample project. A ``code-block`` can be declared as shown below, including spaces, blank lines, and indentation:

.. code-block:: rst

  .. code-block:: c#

  public void Foo()
  {
    // Foo all the things!
  }

This results in:

.. code-block:: c#

  public void Foo()
  {
    // Foo all the things!
  }

The code block ends when you begin a new paragraph without indentation. `Sphinx supports quite a few different languages <http://pygments.org/docs/lexers/>`_. Some common language strings that are available include:

- ``rst``
- ``c#``
- ``javascript``
- ``html``

.. _Captions: 

Line numbers should only be used while editing to assist in find the line numbers to emphasize. Code blocks also support line numbers and emphasizing or highlighting certain lines:

.. code-block:: rst

  .. code-block:: c#
    :linenos:
    :emphasize-lines: 3

    public void Foo()
    {
      // Foo all the things!
    }

This results in:

.. code-block:: c#
  :linenos:
  :emphasize-lines: 3

  public void Foo()
  {
    // Foo all the things!
  }

.. note:: Once the ``emphasize-lines`` is determined, remove ``:linenos:``. When updating a doc, remove all occurrences of ``:linenos:``.

.. note:: ``caption`` and ``name`` will result in a code-block not being displayed due to our builds using a Sphinx version prior to version 1.3. If you don't see a code block displayed above this note, it's most likely because the version of Sphinx is < 1.3.

Images
^^^^^^

Images such as screen shots and explanatory figures or diagrams should be placed in a ``_static`` folder within a folder named the same as the article file. References to images should therefore always be made using relative references, e.g. ``article-name/style-guide/_static/asp-net.png``. Note that images should always be saved as all lower-case file names, using hyphens to separate words, if necessary.

.. note:: Do not use images for code. Use ``code-block`` or ``literalinclude`` instead.

To include an image in an article, use the ``.. image`` directive:

.. code-block:: rst

  .. image:: _static/images/manningface.jpg

.. note:: No quotes are needed around the file name.

Here's an example using the above syntax:

.. image:: _static/images/manningface.jpg

Images are responsively sized according to the browser viewport when using this directive.

Notes
^^^^^

To add a note callout, like the ones shown in this document, use the ``.. note::`` directive.

.. code-block:: rst

  .. note:: This is a note.

This results in:

.. note:: This is a note.

Including External Source Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

One nice feature of ReStructuredText is its ability to reference external files. This allows actual sample source files to be referenced from documentation articles, reducing the chances of the documentation content getting out of sync with the actual, working code sample (assuming the code sample works, of course). However, if documentation articles are referencing samples by filename and line number, it is important that the documentation articles be reviewed whenever changes are made to the source code, otherwise these references may be broken or point to the wrong line number. For this reason, it is recommended that samples be specific to individual articles, so that updates to the sample will only affect a single article (at most, an article series could reference a common sample). Samples should therefore be placed in a subfolder named the same as the article file, in a ``sample`` folder (e.g. ``/article-name/sample/``).

External file references can specify a language, emphasize certain lines, display line numbers (recommended), similar to `Source Code`_. Remember that these line number references may need to be updated if the source file is changed.

.. code-block:: rst

  .. literalinclude:: style-guide/_static/startup.cs
    :language: c#
    :emphasize-lines: 19,25-27
    :linenos:

.. literalinclude:: style-guide/_static/startup.cs
  :language: c#
  :emphasize-lines: 19,25-27
  :linenos:

You can also include just a section of a larger file, if desired:

.. code-block:: rst
  :emphasize-lines: 3

  .. literalinclude:: style-guide/_static/startup.cs
    :language: c#
    :lines: 1,4,20-
    :linenos:

This would include the first and fourth line, and then line 20 through the end of the file.

Literal includes also support `Captions`_ and names, as with ``code-block`` elements. If the ``caption`` is left blank, the file name will be used as the caption. Note that captions and names are available with Sphinx 1.3, which the ReadTheDocs theme used by this system is not yet updated to support.

Format code to eliminate or minimize horizontal scroll bars.

Tables
^^^^^^

Tables should never render with horizontal scroll bars. Tables can be constructed using grid-like "ASCII Art" style text. In general they should only be used where it makes sense to present some tabular data. Rather than include all of the syntax options here, you will find a detailed reference at `<http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#grid-tables>`_.

UI navigation
^^^^^^^^^^^^^

When documenting how a user should navigate a series of menus, use the ``:menuselection:`` directive. To keep styles consistent use this for any navigation, even if it is a single path.

.. code-block:: rst

  :menuselection:`Windows --> Views --> Other...`

This will result in :menuselection:`Windows --> Views --> Other...`.

.. code-block:: rst

  :menuselection:`Submit To Prime`

This will result in :menuselection:`Submit To Prime`.


------------------
Additional Reading
------------------

https://docs.asp.net/en/latest/contribute/style-guide.html

http://docutils.sourceforge.net/docs/user/rst/quickref.html

http://blog.apastyle.org/apastyle/2012/03/title-case-and-sentence-case-capitalization-in-apa-style.html