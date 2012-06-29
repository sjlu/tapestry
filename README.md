# the sjlu tapestry

From the name you probably know that this is something for Homebrew, also known as a tapestry of formulas (its the terminology they have). It helps you setup a working development environment for MAMP without the need to do it yourself. It includes pesky libraries that you need and had to previously install manually into MAMP so you don't have to drink your fustrations away.

## install

We assume that you have [Homebrew](http://mxcl.github.com/homebrew/) installed already. If not, its really simple.

    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

When you have it setup, you need to add our "Formulas". Pretty easy.

    brew tap sjlu/tapestry

If "tapping" doesn't work, you'll most likely need to upgrade your Homebrew by simply executing the command above again.

## packages

You can install packages using this tapestry by doing

    brew install sjlu/tapestry/package

Some packages you may wanna install for your environment are:
* mamp
* vhosts
* ssl
