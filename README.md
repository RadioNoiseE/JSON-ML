<h1 align="center">JSON-ML <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="MIT License" align="right"></h1>

<p align="center"><i>A minimal, flexible, and dependency-free JSON parser implemented in OCaml</i>.</p>

---

```ocaml
open Json.Util

let json_string = {|
  {"number" : 42,
   "string" : "yes",
   "list": ["for", "sure", 42]}|}  (* val json_string : string *)

let json = parse json_string;;  (* val json : Json.Datatype.stt *)

let num = json
       |> get_child "number"
       |> as_number;;  (* val num : float *)
print_float num;;

let mem = json
       |> get_child "list"
       |> get_mem 0
       |> as_string;;  (* val mem : string *)
print_string mem;;

(* test/test.ml, compile using ocamlopt with files: json.{cmx|cmi|o}. *)
```

## Dependencies

- Basic OCaml development environment. (`opam` is not required)
  - Gentoo: `doas emerge -a dev-lang/ocaml`;
  - Debian: `apt install ocaml`;
  - Fedora: `dnf install ocaml`;
  - Centos: `yum install ocaml`;
  - SuSE: `zypper install ocaml`;
  - Arch: `pacman -S ocaml`;
  - FreeBSD: `pkg install ocaml`;
  - Open/NetBSD: `pkg_add ocaml`;
- GNU `make`.

## Build

1. Download the source files.
```shell
$ git clone https://github.com/RadioNoiseE/JSON-ML
```
2. To build the native code sub-module, run `make` in the `JSON-ML/` directory.
3. To run a test, run `make test`. Then kindly `cd` into the `test/` directory and run `make` again.
