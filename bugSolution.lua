Several strategies can prevent issues:

1. **Iterate over a copy:** Create a copy of the table before iterating to avoid modifying the original.

```lua
local function safeFoo(t)
  local tCopy = {}
  for k, v in pairs(t) do
    tCopy[k] = v
  end
  for k, v in pairs(tCopy) do
    if type(v) == "table" then
      safeFoo(v)
    end
  end
end
```

2. **Build a new table:** Instead of modifying the existing table, construct a new table with the desired changes.

```lua
local function saferBar(t)
  local newTable = {}
  local function helper(subtable)
    for k, v in pairs(subtable) do
      if type(v) == "table" then
        helper(v)
      else
        newTable[k] = v
      end
    end
  end
  helper(t)
  newTable.new = 4 -- Add new value here
  return newTable
end
```

3. **Use ipairs for sequential access (if applicable):**  If you need to iterate sequentially through a numerically indexed table, `ipairs` is safer because modification doesn't disrupt the index order.  However, `ipairs` stops when it encounters a nil value. 