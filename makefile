# Makefile for the program JSON-ML.
# Copyright 2023-2024, Jing Huang.
# Licensed MIT.

omlc := ocamlopt

all: json_lib clean_aux

json_lib: lexer.mll parser.mly util.ml datatype.ml
	ocamllex lexer.mll
	ocamlyacc parser.mly
	${omlc} -c datatype.ml -for-pack Json
	${omlc} -c parser.mli
	${omlc} -c lexer.ml -for-pack Json
	${omlc} -c parser.ml -for-pack Json
	${omlc} -c util.ml -for-pack Json
	${omlc} -pack -o json.cmx datatype.cmx lexer.cmx parser.cmx util.cmx
	mv json.cmi lib/json.cmi
	mv json.cmx lib/json.cmx
	mv json.o lib/json.o

clean_aux:
	rm -f *.[oa] util.[oa] *.so util.so *.cm[ioax] util.cm[ioax] lexer.ml parser.ml parser.mli

test: lib/json.cmx lib/json.cmi lib/json.o test/test.ml
	cp lib/* test/

clean:
	rm -f *.[oa] *.so *.cm[ioax] *.cmxa lexer.ml parser.ml parser.mli

.PHONY: json_lib clean_aux
