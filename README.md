# Lua pairs Iterator and Table Modification

This repository demonstrates a potential issue with Lua's `pairs` iterator when the table being iterated over is modified during the iteration process.  Modifying a table while iterating with `pairs` can lead to unexpected behavior, including skipped elements or even infinite loops. The example shows how to reproduce the issue and a recommended way to avoid it.