return {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        -- https://github.com/ray-x/go.nvim/issues/113
        codelenses = {
            generate = true, -- show the `go generate` lens.
            gc_details = true, --  // Show a code lens toggling the display of gc's choices.
            test = true,
            tidy = true,
        },
      },
}
