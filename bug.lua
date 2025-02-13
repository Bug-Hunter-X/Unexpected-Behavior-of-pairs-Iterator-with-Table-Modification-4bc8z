local function foo(t)
  for k, v in pairs(t) do
    if type(v) == "table" then
      foo(v)
    end
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo(t)

--The above code will work as expected. However, if we modify the table t while iterating over it, this could cause issues.

local function bar(t)
  for k, v in pairs(t) do
    if type(v) == "table" then
      bar(v)
    end
    t.new = 4 --Modifying table during iteration
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
bar(t)