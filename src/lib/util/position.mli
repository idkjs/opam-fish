(** A [t] represents a position on the fish game board. Check @see 'game/board'
    for how a position is interpreted. *)
type t =
  { col : int
  ; row : int
  }

(** Creates a list of distinct positions (row, col) for
    0 <= row < [height] and 0 <= column < [width] *)
val create_positions_within : height:int -> width:int -> t list
