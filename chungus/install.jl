#!/usr/bin/env julia

packages = ["IJulia",
            "RCall",
            "PyCall",
            "StatsKit",
            "StableRNGs",
            "ThreadsX",
            "Plots",
            "Makie",
            "Gadfly",
            "Pluto",
            "Weave",
            "LaTeXStrings",
            "Literate",
            "Bio"];
using Pkg;
Pkg.add(packages);
