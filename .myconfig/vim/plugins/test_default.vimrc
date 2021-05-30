function! CustomStrategy(cmd)
  execute 'bel 15 new'
  call termopen(a:cmd)
  wincmd p " switch back to last window
endfunction

let test#custom_strategies = {'custom': function('CustomStrategy')}
let test#strategy = 'custom'
