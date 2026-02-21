# nav

URL and history navigation primitives.

## API

```
#use wasm.bats-packages.dev/nav as N
#use array as A

(* Read the current URL into a buffer.
   Returns the actual byte length. *)
$N.get_url{l:agz}{n:nat}
  (out: !A.arr(byte, l, n), max_len: int n) : int

(* Read the URL hash fragment into a buffer.
   Returns the actual byte length. *)
$N.get_hash{l:agz}{n:nat}
  (out: !A.arr(byte, l, n), max_len: int n) : int

(* Set the URL hash fragment (safe text). *)
$N.set_hash{n:nat}(hash: A.text(n), hash_len: int n) : void

(* Replace the current history entry. *)
$N.replace_state{lb:agz}{n:nat}
  (url: !A.borrow(byte, lb, n), url_len: int n) : void

(* Push a new history entry. *)
$N.push_state{lb:agz}{n:nat}
  (url: !A.borrow(byte, lb, n), url_len: int n) : void
```

## Dependencies

- **array**
