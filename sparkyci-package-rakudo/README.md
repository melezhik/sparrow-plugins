# sparkyci-package-rakudo

Installs rakudo meta package on sparkyci

# Install

    s6 --install sparkyci-package-rakudo

# Usage

    task-run "rakudo package", "sparkyci-package-rakudo", %(
      version => "d4e8b671ab38d7b02b3f1eaa263b4ee6da1cad01"
    );

# Author

Alexey Melezhik
