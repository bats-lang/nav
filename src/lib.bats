(* nav -- browser navigation: URL, hash, history *)

#include "share/atspre_staload.hats"

#use array as A
#use wasm.bats-packages.dev/bridge as B
#use result as R

#pub fun get_url
  {l:agz}{n:pos}
  (out: !$A.arr(byte, l, n), max_len: int n): $R.result(int, int)

#pub fun get_hash
  {l:agz}{n:pos}
  (out: !$A.arr(byte, l, n), max_len: int n): $R.result(int, int)

#pub fun set_hash
  {lb:agz}{n:nat}
  (hash: !$A.borrow(byte, lb, n), hash_len: int n): void

#pub fun replace_state
  {lb:agz}{n:nat}
  (url: !$A.borrow(byte, lb, n), url_len: int n): void

#pub fun push_state
  {lb:agz}{n:nat}
  (url: !$A.borrow(byte, lb, n), url_len: int n): void

implement get_url{l}{n}(out, max_len) =
  $B.get_url(out, max_len)

implement get_hash{l}{n}(out, max_len) =
  $B.get_hash(out, max_len)

implement set_hash{lb}{n}(hash, hash_len) =
  $B.set_hash(hash, hash_len)

implement replace_state{lb}{n}(url, url_len) =
  $B.replace_state(url, url_len)

implement push_state{lb}{n}(url, url_len) =
  $B.push_state(url, url_len)

(* Register callback for browser back/forward navigation.
   Callback receives URL length. Read URL bytes with stash_read(buf, 1, len). *)
#pub fun on_navigate
  (cb: (int) -<cloref1> int): void

implement on_navigate(cb) =
  $B.set_popstate_callback(cb)
