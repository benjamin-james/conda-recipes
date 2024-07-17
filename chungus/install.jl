#!/usr/bin/env julia

packages = ["IJulia",
            "RCall",
            "PyCall",
            "StatsKit",
            "Plots",
            "Makie",
            "Gadfly",
            "Pluto",
            "Weave",
            "LaTeXStrings",
            "Literate",
            "Bio"];
using Pkg;
Pkg.update();
Pkg.add(packages);

#            "StableRNGs",
