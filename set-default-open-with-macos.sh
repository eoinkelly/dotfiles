#!/usr/bin/env bash

# https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1

set -x
set -e

duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.ruby-script all
duti -s com.microsoft.VSCode public.json all
duti -s com.microsoft.VSCode public.css all
duti -s com.microsoft.VSCode com.netscape.javascript-source all
duti -s com.microsoft.VSCode net.daringfireball.markdown all
duti -s com.microsoft.VSCode public.text all
duti -s com.microsoft.VSCode public.xml all
duti -s com.microsoft.VSCode public.shell-script all
duti -s com.microsoft.VSCode public.php-script all
duti -s com.microsoft.VSCode public.python-script all
