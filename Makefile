#############################################################################
##  v      #                   The Coq Proof Assistant                     ##
## <O___,, #                INRIA - CNRS - LIX - LRI - PPS                 ##
##   \VV/  #                                                               ##
##    //   #  Makefile automagically generated by coq_makefile V8.3pl1     ##
#############################################################################

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

#
# This Makefile was generated by the command line :
# coq_makefile -f Make -o Makefile 
#

# 
# This Makefile may take 3 arguments passed as environment variables:
#   - COQBIN to specify the directory where Coq binaries resides;
#   - CAMLBIN and CAMLP4BIN to give the path for the OCaml and Camlp4/5 binaries.
COQLIB:=$(shell $(COQBIN)coqtop -where | sed -e 's/\\/\\\\/g')
CAMLP4:="$(shell $(COQBIN)coqtop -config | awk -F = '/CAMLP4=/{print $$2}')"
ifndef CAMLP4BIN
  CAMLP4BIN:=$(CAMLBIN)
endif

CAMLP4LIB:=$(shell $(CAMLP4BIN)$(CAMLP4) -where)

##########################
#                        #
# Libraries definitions. #
#                        #
##########################

OCAMLLIBS:=-I src\
  -I ../Containers/src\
  -I ../Nfix/src\
  -I ../Counting/src
COQSRCLIBS:=-I $(COQLIB)/kernel -I $(COQLIB)/lib \
  -I $(COQLIB)/library -I $(COQLIB)/parsing \
  -I $(COQLIB)/pretyping -I $(COQLIB)/interp \
  -I $(COQLIB)/proofs -I $(COQLIB)/tactics \
  -I $(COQLIB)/toplevel \
  -I $(COQLIB)/plugins/cc \
  -I $(COQLIB)/plugins/dp \
  -I $(COQLIB)/plugins/extraction \
  -I $(COQLIB)/plugins/field \
  -I $(COQLIB)/plugins/firstorder \
  -I $(COQLIB)/plugins/fourier \
  -I $(COQLIB)/plugins/funind \
  -I $(COQLIB)/plugins/micromega \
  -I $(COQLIB)/plugins/nsatz \
  -I $(COQLIB)/plugins/omega \
  -I $(COQLIB)/plugins/quote \
  -I $(COQLIB)/plugins/ring \
  -I $(COQLIB)/plugins/romega \
  -I $(COQLIB)/plugins/rtauto \
  -I $(COQLIB)/plugins/setoid_ring \
  -I $(COQLIB)/plugins/subtac \
  -I $(COQLIB)/plugins/subtac/test \
  -I $(COQLIB)/plugins/syntax \
  -I $(COQLIB)/plugins/xml
COQLIBS:=-I src\
  -I ../Containers/src\
  -I ../Nfix/src\
  -I ../Counting/src -R theories Ergo\
  -R ../Containers/theories Containers\
  -R ../Nfix/theories Nfix\
  -R ../Counting/theories Counting
COQDOCLIBS:=-R theories Ergo\
  -R ../Containers/theories Containers\
  -R ../Nfix/theories Nfix\
  -R ../Counting/theories Counting

##########################
#                        #
# Variables definitions. #
#                        #
##########################

ZFLAGS=$(OCAMLLIBS) $(COQSRCLIBS) -I $(CAMLP4LIB)
OPT:=
COQFLAGS:=-q $(OPT) $(COQLIBS) $(OTHERFLAGS) $(COQ_XML)
ifdef CAMLBIN
  COQMKTOPFLAGS:=-camlbin $(CAMLBIN) -camlp4bin $(CAMLP4BIN)
endif
COQC:=$(COQBIN)coqc
COQDEP:=$(COQBIN)coqdep -c
GALLINA:=$(COQBIN)gallina
COQDOC:=$(COQBIN)coqdoc
COQMKTOP:=$(COQBIN)coqmktop
CAMLLIB:=$(shell $(CAMLBIN)ocamlc.opt -where)
CAMLC:=$(CAMLBIN)ocamlc.opt -c -rectypes
CAMLOPTC:=$(CAMLBIN)ocamlopt.opt -c -rectypes
CAMLLINK:=$(CAMLBIN)ocamlc.opt -rectypes
CAMLOPTLINK:=$(CAMLBIN)ocamlopt.opt -rectypes
GRAMMARS:=grammar.cma
CAMLP4EXTEND:=pa_extend.cmo pa_macro.cmo q_MLast.cmo
CAMLP4OPTIONS:=
ERGO_PLUGIN=src/ergo_plugin.cma
ERGO_PLUGINOPT=src/ergo_plugin.cmxs
COQDOC=$(COQBIN)coqdoc -interpolate -utf8
CAMLP4OPTIONS=-loc loc
PP:=-pp "$(CAMLP4BIN)$(CAMLP4)o -I $(CAMLLIB) -I . $(COQSRCLIBS) $(CAMLP4EXTEND) $(GRAMMARS) $(CAMLP4OPTIONS) -impl"

###################################
#                                 #
# Definition of the "all" target. #
#                                 #
###################################

VFILES:=theories/Adequation.v\
  theories/AllInstances.v\
  theories/AltErgo.v\
  theories/CCX.v\
  theories/CNFLazyCommon.v\
  theories/CNFLazyN.v\
  theories/CNFLazy.v\
  theories/Cnf.v\
  theories/CPolynoms.v\
  theories/DiagProd.v\
  theories/Diff.v\
  theories/DistrNeg.v\
  theories/DoubleNegUtils.v\
  theories/Dpll.v\
  theories/EnvLazy.v\
  theories/Env.v\
  theories/Ergo.v\
  theories/FoldProps.v\
  theories/Index.v\
  theories/Lexico.v\
  theories/Literal.v\
  theories/LLazy.v\
  theories/ModelsRingExt.v\
  theories/Rational.v\
  theories/SatCaml.v\
  theories/Sat.v\
  theories/Semantics.v\
  theories/SemLazy.v\
  theories/TacticLazy.v\
  theories/TermUtils.v\
  theories/Term.v\
  theories/TheoryArith.v\
  theories/Theory.v\
  theories/Uf.v\
  theories/Use.v\
  tests/AltDemo.v\
  tests/Demo.v\
  tests/EinsteinEasy2.v\
  tests/EinsteinEasy.v\
  tests/GeneratorsEq.v\
  tests/GeneratorsNG.v\
  tests/Generators.v\
  tests/TestErgo.v
VOFILES:=$(VFILES:.v=.vo)
VOFILES1:=$(patsubst theories/%,%,$(filter theories/%,$(VOFILES)))
VOFILES0:=$(filter-out theories/% ../Containers/theories/% ../Nfix/theories/% ../Counting/theories/%,$(VOFILES))
GLOBFILES:=$(VFILES:.v=.glob)
VIFILES:=$(VFILES:.v=.vi)
GFILES:=$(VFILES:.v=.g)
HTMLFILES:=$(VFILES:.v=.html)
GHTMLFILES:=$(VFILES:.v=.g.html)
MLFILES:=src/arith.ml\
  src/ergo.ml\
  src/ergo_plugin_mod.ml
CMOFILES:=$(MLFILES:.ml=.cmo)
CMOFILES0:=$(filter-out theories/% ../Containers/theories/% ../Nfix/theories/% ../Counting/theories/%,$(CMOFILES))
CMIFILES:=$(MLFILES:.ml=.cmi)
CMIFILES0:=$(filter-out theories/% ../Containers/theories/% ../Nfix/theories/% ../Counting/theories/%,$(CMIFILES))
CMXFILES:=$(MLFILES:.ml=.cmx)
CMXSFILES:=$(MLFILES:.ml=.cmxs)
CMXSFILES0:=$(filter-out theories/% ../Containers/theories/% ../Nfix/theories/% ../Counting/theories/%,$(CMXSFILES))
OFILES:=$(MLFILES:.ml=.o)

all: $(VOFILES) $(CMOFILES) $(CMXSFILES) src/ergo_plugin.cmxs\
  src/ergo_plugin.cma
spec: $(VIFILES)

gallina: $(GFILES)

html: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc -html $(COQDOCLIBS) -d html $(VFILES)

gallinahtml: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc -html -g $(COQDOCLIBS) -d html $(VFILES)

all.ps: $(VFILES)
	$(COQDOC) -toc -ps $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`

all-gal.ps: $(VFILES)
	$(COQDOC) -toc -ps -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`

all.pdf: $(VFILES)
	$(COQDOC) -toc -pdf $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`

all-gal.pdf: $(VFILES)
	$(COQDOC) -toc -pdf -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`



###################
#                 #
# Custom targets. #
#                 #
###################

src/ergo_plugin.cmxs: src/arith.cmx src/ergo.cmx src/ergo_plugin_mod.cmx
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -shared -o src/ergo_plugin.cmxs src/arith.cmx src/ergo.cmx src/ergo_plugin_mod.cmx

src/ergo_plugin.cma: src/arith.cmo src/ergo.cmo src/ergo_plugin_mod.cmo
	$(CAMLLINK) -g -a -o src/ergo_plugin.cma src/arith.cmo src/ergo.cmo src/ergo_plugin_mod.cmo

%.vo %.glob: %.v $(ERGO_PLUGINOPT) $(ERGO_PLUGIN)
	$(COQBIN)coqc $(COQDEBUG) $(COQFLAGS) $*

####################
#                  #
# Special targets. #
#                  #
####################

.PHONY: all opt byte archclean clean install depend html

%.cmi: %.mli
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $<

%.cmo: %.ml
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $(PP) $<

%.cmx: %.ml
	$(CAMLOPTC) $(ZDEBUG) $(ZFLAGS) $(PP) $<

%.cmxs: %.ml
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -shared -o $@ $(PP) $<

%.cmo: %.ml4
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $(PP) -impl $<

%.cmx: %.ml4
	$(CAMLOPTC) $(ZDEBUG) $(ZFLAGS) $(PP) -impl $<

%.cmxs: %.ml4
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -shared -o $@ $(PP) -impl $<

%.ml.d: %.ml
	$(CAMLBIN)ocamldep -slash $(OCAMLLIBS) $(PP) "$<" > "$@"

%.vo %.glob: %.v
	$(COQC) $(COQDEBUG) $(COQFLAGS) $*

%.vi: %.v
	$(COQC) -i $(COQDEBUG) $(COQFLAGS) $*

%.g: %.v
	$(GALLINA) $<

%.tex: %.v
	$(COQDOC) -latex $< -o $@

%.html: %.v %.glob
	$(COQDOC) -html $< -o $@

%.g.tex: %.v
	$(COQDOC) -latex -g $< -o $@

%.g.html: %.v %.glob
	$(COQDOC) -html -g $< -o $@

%.v.d: %.v
	$(COQDEP) -slash $(COQLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

byte:
	$(MAKE) all "OPT:=-byte"

opt:
	$(MAKE) all "OPT:=-opt"

install:
	mkdir -p $(COQLIB)/user-contrib
	(cd theories; for i in $(VOFILES1); do \
	 install -d `dirname $(COQLIB)/user-contrib/Ergo/$$i`; \
	 install $$i $(COQLIB)/user-contrib/Ergo/$$i; \
	 done)
	(for i in $(VOFILES0); do \
	 install -d `dirname $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i`; \
	 install $$i $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i; \
	 done)
	(for i in $(CMOFILES0); do \
	 install -d `dirname $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i`; \
	 install $$i $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i; \
	 done)
	(for i in $(CMIFILES0); do \
	 install -d `dirname $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i`; \
	 install $$i $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i; \
	 done)
	(for i in $(CMXSFILES0); do \
	 install -d `dirname $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i`; \
	 install $$i $(COQLIB)/user-contrib/$(INSTALLDEFAULTROOT)/$$i; \
	 done)

clean:
	rm -f $(CMOFILES) $(CMIFILES) $(CMXFILES) $(CMXSFILES) $(OFILES) $(VOFILES) $(VIFILES) $(GFILES) $(MLFILES:.ml=.cmo) $(MLFILES:.ml=.cmx) *~
	rm -f all.ps all-gal.ps all.pdf all-gal.pdf all.glob $(VFILES:.v=.glob) $(HTMLFILES) $(GHTMLFILES) $(VFILES:.v=.tex) $(VFILES:.v=.g.tex) $(VFILES:.v=.v.d)
	rm -f $(CMOFILES) $(MLFILES:.ml=.cmi) $(MLFILES:.ml=.ml.d) $(MLFILES:.ml=.cmx) $(MLFILES:.ml=.o)
	- rm -rf html
	- rm -f src/ergo_plugin.cmxs
	- rm -f src/ergo_plugin.cma

archclean:
	rm -f *.cmx *.o


printenv: 
	@echo CAMLC =	$(CAMLC)
	@echo CAMLOPTC =	$(CAMLOPTC)
	@echo CAMLP4LIB =	$(CAMLP4LIB)

Makefile: Make
	mv -f Makefile Makefile.bak
	$(COQBIN)coq_makefile -f Make -o Makefile


-include $(VFILES:.v=.v.d)
.SECONDARY: $(VFILES:.v=.v.d)

-include $(MLFILES:.ml=.ml.d)
.SECONDARY: $(MLFILES:.ml=.ml.d)

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

