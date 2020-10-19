module P = Fish.Game.Penguin
module Pos = Fish.Util.Position

let tests = OUnit2.(>:::) "penguin_tests" [
    OUnit2.(>::) "test_construction" (fun _ ->
        let pos00 = { Pos.row = 0; col = 0 } in
        let p = P.create pos00 in
        OUnit2.assert_equal 0 (P.get_fish_held p);
        OUnit2.assert_equal pos00 (P.get_position p);
      );

    OUnit2.(>::) "test_set_fish_held" (fun _ ->
        (* 1. new penguin has expected fish_held, and nothing else changes
         * 2. no side effect
         * 3. errors when input is negative *)
        let pos34 = { Pos.row = 3; col = 4 } in
        let p1 = P.create pos34 in
        let p2 = P.set_fish_held p1 2 in
        OUnit2.assert_equal 0 (P.get_fish_held p1);
        OUnit2.assert_equal pos34 (P.get_position p1);
        OUnit2.assert_equal 2 (P.get_fish_held p2);
        OUnit2.assert_equal pos34 (P.get_position p2);
        let expect = Failure "fish_held must be non-negative" in
        OUnit2.assert_raises expect (fun () -> P.set_fish_held p2 ~-1);
      );

    OUnit2.(>::) "test_set_position" (fun _ ->
        (* 1. new penguin has expected position, and nothing else changes
         * 2. no side effect *)
        let pos34 = { Pos.row = 3; col = 4 } in
        let pos12 = { Pos.row = 1; col = 2 } in
        let p1 = P.create pos34 in
        let p2 = P.set_position p1 pos12 in
        OUnit2.assert_equal 0 (P.get_fish_held p1);
        OUnit2.assert_equal pos34 (P.get_position p1);
        OUnit2.assert_equal 0 (P.get_fish_held p2);
        OUnit2.assert_equal pos12 (P.get_position p2);
      );
  ]

let _ =
  OUnit2.run_test_tt_main tests
