# the sjlu tapestry

From the name you probably know that this is something for Homebrew, also known as a tapestry of formulas (its the terminology they have). It helps you setup a working development environment for MAMP without the need to do it yourself. It includes pesky libraries that you need and had to previously install manually into MAMP so you don't have to drink your fustrations away.

This was brought to you by [@noisedev](http://github.com/noisedev), where the repository will most likely migrate to.

## install

We assume that you have [Homebrew](http://mxcl.github.com/homebrew/) installed already. If not, its really simple.

    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

When you have it setup, you need to add our "Formulas". Due to a weird bug, you'll have to do it manually.

    git clone git@github.com:sjlu/tapestry.git /usr/local/Library/Taps/sjlu-tapestry

If "tapping" doesn't work, you'll most likely need to upgrade your Homebrew by simply executing the command above again.

## packages

You can install packages using this tapestry by doing

    brew install sjlu/tapestry/package

Some packages you may wanna install for your environment are:
* mamp
* vhosts
* ssl
