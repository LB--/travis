travis
======
[Travis CI](https://travis-ci.org/) is great and all, but it has horribly outdated software for C and C++.
It can be a huge pain to try and figure out how to manually update or install the necessary software.
This repository is meant to put an end to that:
we've done most of the hard work for you, and you can just copypaste thanks to the public domain license.
If you can, try to help out by keeping this repo up to date with pull requests.

Currently, the following things are handled properly:
* Either GCC 6 or Clang 3.8 is installed and the `$CC` and `$CXX` environment variables are updated accordingly
* CMake 3.6.1 binaries are downloaded or cached by Travis and we add it to `$PATH`
* Boost 1.61.0 is built with only the libraries you request and `$BOOST_ROOT` is set properly

It would be nice if these things could be fixed:
* Clang currently fails to download a majority of the time - seems to be an issue on LLVM's end
* Boost has to be built with GCC because it produces errors with Clang - it would be nice to not require GCC during a Clang build
* If you need to change which Boost libraries you want built, you have to clear the cache - it would be nice if the scripts could automatically detect which libraries are cached and which aren't
* Currently only `linux` is used to test on, it would be nice to be able to use `osx` with all the same bells and whistles
* It would be amazing if Travis would just _update all the things_ for us, so that we don't have to muck around doing it ourselves

[Travis is set to build pull requests, so you can start a PR and muck around with it.](https://travis-ci.org/LB--/travis/pull_requests)

#**GLHF**
