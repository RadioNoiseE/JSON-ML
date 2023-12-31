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
