# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Extras desactivados

Algunos extras de LazyVim están desactivados por defecto. Para reactivarlos:

### Codeium / Windsurf (autocompletado con IA)

1. `:LazyExtras` → activar `lazyvim.plugins.extras.ai.codeium`.
2. Editar `lua/plugins/windsurf.lua` y descomentar el bloque `dependencies`,
   el bloque `providers` y la entrada `"codeium"` en `sources.default`.

### Claude Code

1. `:LazyExtras` → activar `lazyvim.plugins.extras.ai.claudecode`.
