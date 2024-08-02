Lib = {}
Lib.Table = {}
Lib.Keys = {}

function Lib.Table.extend(t1,t2)
   for k, v in pairs(t2) do
      t1[k] = v
   end
   return t1
end

function Lib.Keys.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require"plenary.reload".reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
