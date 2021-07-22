# Install

    s6 --install weasyprint

# Description

weasyprint wrapper

# Usage

Cli

    s6 --plg-run weasyprint@in=file.html,out=file.pdf

Raku

    task-run "html-to-pdf", "weasyprint" %(
      in => "CV.html",
      out => "CV.pdf"
    );

# See also

* [weasyprint](https://weasyprint.org)

# Author

Alexey Melezhik

