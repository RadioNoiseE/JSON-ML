all: test

test: json.cmx json.cmi json.o test.ml
	@ocamlopt -c test.ml
	@ocamlopt json.cmx test.cmx
	./a.out
	@echo ""
	@rm -f *.out *.cm[ix] *.o
