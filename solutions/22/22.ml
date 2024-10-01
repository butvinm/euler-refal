open String


let names_file = "solutions/22/0022_names.txt"


let alphanum c = Char.code c - Char.code 'A' + 1


let lex_score word =
  List.of_seq (String.to_seq word)
  |> List.map alphanum
  |> List.fold_left (+) 0


let solve names_str =
  split_on_char ',' names_str
  |> List.map (fun name -> sub name 1 (length name - 2))
  |> List.sort String.compare
  |> List.mapi (fun i name -> (i + 1) * lex_score name)
  |> List.fold_left (+) 0


let () =
  let ic = open_in names_file in
  let line = input_line ic in
  print_endline (string_of_int (solve line))
