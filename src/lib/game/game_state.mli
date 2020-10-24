(** A [t] represents a snapshot of the game state at a certain time.
    It includes:
      - the board state
      - state of all participating players (with unique colors)
      - the order in which players take turn
    It excludes:
      - whose turn it is
      - how to communicate with the actual players
    NOTE that it's immutable *)
type t

(** Create a game state with given board and participating players 
    Errors if there are duplicates in the colors *)
val create : Board.t -> Player_color.t list -> t

val get_board_copy : t -> Board.t

val get_player_list : t -> Player_list.t

(** Return a board after removing all tiles that have a penguin on it *)
val get_board_minus_penguins : t -> Board.t

(** Place a new penguin with given color at given position on the board.
    Errors if the no the participating player has given color, or if
    position is out of bound *)
val place_penguin : t -> Player_color.t -> Position.t -> t

(** Move the penguin at 1st position to the 2nd position, and update player
    score accordingly.
    Errors if either position is out of bound or source is empty *)
val move_penguin : t -> Position.t -> Position.t -> t

(** Discouraged unless you have good reason and know what you are doing *)
val from_board_playerlist : Board.t -> Player_list.t -> t
