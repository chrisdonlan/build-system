The goal of this project to to finish off, for my personal purposes, one build system/architecture to "rule them all":

It should be 

1) Multilingual (in terms of computer languages) without forcing any interweaving of languages (even for C/Cpp this appears to be a mistake)

2) Fully-Integrated (from, at least, a language and build perspective).  It should make use of all the modern tools available via the open-source community, but it should work on the native system (I am a vim user, so: vim). 

3) It should be procedurally powerful (examples of this include: Cmake, automake), but it should be as adaptable as a language (i.e., gnu-make).  Note that virtually everything Cmake does can be replaced by "getting gud" at `make`, and making use of the command line tools (i.e., `find`). 
  
  a) This pays dividends down the line, as `make` is essentially the world's oldest automation framework
  
  b) GNU R integrates well with `make` as an automation language inside `make`'s procedural system
  
  c) GNU R also provides visualization capabilitiesrun bash script with make environment exported
  
  d) Make can be used to coordinate other automation frameworks, manage databases--in otherwords, it is an effective procedural glue
  
4) Remote and Distributed Stability/integration: the system should allow the developer (me) to spread a project out across multiple boxes without (A) losing control, or (B) having to deploy an entire "system" that takes one entire brain to deploy, use and curate.

5) Finally, I should improve upon the methodologies used for tab completion within the context of my project framework.  I believe thish should be as simple is knitting together the native bash (or zsh) completion api, and improving/adapting a particular `make all -> JSON database` project to a database that gets filled by a make crawler running (pseudocode) `for command in make_command_list; do load_database $(make -n $(command)); done` in the background (as a simple example). 

6) If I want to, set up a project visualization tool that can map out and visualize my project.  Perhaps I can deploy machine learning on the database data I am able to gather as I use the tool. 

# Universal Words

```
make setup
make build
make test
```

# Universal Files

Universal Files are installed to node via symlink to `.universal`
```

.universal/cfg.mk
 // universal vars
 ROOT
 PREV
 NODE
 NAME
 BRANCHES
 
 .universal/commands.mk
 ...
  
 .universal/etc.
```
Usage is currently going to be handled with BASH scripts scoped to minimal varienty: the user is informed of the metavariables involved in executing a `.PHONY` make command, and is prompted to confirm the objective.  Running the make command with the flag `-y` will accept whatever the defaults are and execute.  

Currently, the universal makes will all be imported...meaning the `bash-completion` output from a `make <tab><tab>` will soon lose effectiveness.  

When this happens, I'll be forced to deal with the tab completion in a side project that allows for contextualized make tab completion.  I have a few ideas on how to implement this effectively, but it is a bridge best crossed after the problem becomes a problem. 

# Universal Commands

For various languages, there are various things I tend to do which wind up occupying the
majority of my development time.

1) sufficient build genericity and flexibility

2) sufficient file organization to maintain a stable growth pattern

3) language interop (C/C++/BASH/R/Make/Python/Java/Scala/Rust/Go/NodeJS/etc.)
   primarily: (C/C++/R/Make) with Python being increasingly less attractive

4) to be continued...

In order to have all of these things, and preserve the tab completion and other 'high level"
computer assists in the development process, it is most useful to stay in the domain of make.

I have methods which, in a given project, allow me to compose a database for the purposes of
tab completion using make.  Worst case scenario, I'll have to use ctags or improve things on
my own.  But, the bottom line is that the auto-completion tools access some kind of build
"database" produced by some build tool, and there seems to be some standardization there.  So,
starting from this position of staying both open-ended and powerful, gnu-make makes the most
sense.


#### Language Specific Commands

Ideally, for each language I construct a generic nodular template for producing a linkable
library of arbitrary complexity.  Staying within the `modular library` motif, I should scale
at a constant level of build complexity.  A **constant level of build complexity satisfiable
by language specific, but project generic compilation rules**.  I imagine there will be a few
things I'll want to configure in a node-scoped cfg file (such as compiler optimization flags,
or stdlib schemas to use -- c++11, 20, etc.).

However, there is no reason not to be able to construct an entire build system with three or
four symbolic rules to, end to end, generate objects, libraries, and executable main methods
and test applications.

#### Starting With Familiar Solutions

##### Python

I have addressed 100% of the python flexibility that I intend to add: every single node gets
it's own unique python environment by default, courtesy of a centralized project
"Anaconda: Miniconda" install located in the `.universal` folder.

##### GNU R

Increasingly, I am rediscovering the absolutely cool and slick language known as "R".  This
language trivializes statistics and IO/Dataframing that typically take multiple libraries
(NumPy, Scikit-Learn, one of a half dozen JSON libs, Pandas, SciPy, and the **terrible and
completely unusable without internet lookup iterations for every line written** graphing api,
MatPlotlib) and many, many lines of code.

Essentially, where python entails 5-6 files full of toil and busywork to knit functionality
before the project even starts, GNU R jumpstarts you with the apt-get supported CRAN-network,
higher level libraries (entailing vectorized functionality that leapfrogs the manual and
difficult-to-use vectorization available in NumPy at a high level of statistical relevance)
which also advertise compiled C-speeds ... within a functional setup.

GNU-R is also fully integrated with make and bash (although Python has this feature as well),
so it stays very intimate and close to the details.  The language is also semantically less
verbose, and, as pointed out earlier, can be run anywhere within the OS once apt-get depend-
encies are installed, eliminating the need to tote around virtual environments or risk des-
tabilizing the core python install through heavy package install usage.

In short, I am becoming a major fan of this language, and would like to integrate it with
make alongside or perhaps in place of the BASH mini-scripts.

##### C

C is a very simple language to link and build, considering that it is a first class citizen
in the operating system after so many years.

Boilerplate and highly abstracted Makefile compilation commands can be constructed, given that
make was designed with C in mind.

This project will be the first node I work out to completion.

##### C++

C++ is a more complex, and complete, language than C.  Recently, it has become much easier to
work with as the Boost libraries have become more advanced.

Integrating a C++ node with Boost, Eigen3 and perhaps Nvidia CUDA, with a build parameterization
that is both generic, self-explanatory, and as flexible and self-contained (the user (me) no
longer has to screw around with the build tools) as possible will be the hardest part.

However, it will likely be the most important.

##### Rust, Go, etc.

These other languages should be easy to approach and add after finishing C and C++.


# Next steps

Managing an entire multi-lingual code jungle will involve partitioning the make tab completion
into relevant chunks (as .universial grows).  This means I'll need to perhaps modify
`bash-completion` (although that project is particularly unapproachable), or, better yet,
write my own.

Also, making sure that integrated development content is available for each language is a crucial
task.

Once that is finished, I would take a breather... But an ultimate goal would be an ability to create
contextual recipes with modular, command line tools -- here, in terms of design, I am considering the
terminal as if it is a CAD environment, and custom tools as CAD commands.

This would likely be a continuation of the Make-R-BASH-Python integuement that was motivated by the
above.



