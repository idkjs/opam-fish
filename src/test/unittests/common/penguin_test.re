module P = Fish.Common.Penguin;
module Pos = Fish.Util.Position;

let tests =
  OUnit2.(>:::)(
    "penguin_tests",
    [
      OUnit2.(>::)("test_construction", _ => {
        let pos00 = {Pos.row: 0, col: 0};
        let p = P.create(pos00);
        OUnit2.assert_equal(pos00, P.get_position(p));
      }),
      OUnit2.(>::)("test_set_position", _ => {
        /* 1. new penguin has expected position, and nothing else changes
         * 2. no side effect */
        let pos34 = {Pos.row: 3, col: 4};
        let pos12 = {Pos.row: 1, col: 2};
        let p1 = P.create(pos34);
        let p2 = P.set_position(p1, pos12);
        OUnit2.assert_equal(pos34, P.get_position(p1));
        OUnit2.assert_equal(pos12, P.get_position(p2));
      }),
    ],
  );

let _ = OUnit2.run_test_tt_main(tests);
