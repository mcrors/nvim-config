require('dap-go').setup {
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    log = true,
    initialize_timeout_sec = 30,
    console = "internalConsole",
    -- This can help with stability
    port = 38697,
  },
  dap_configurations = {
    {
      type = "go",
      name = "Debug Ginkgo Test",
      request = "launch",
      mode = "test",
      program = "${fileDirname}",
      args = {"-ginkgo.v", "-ginkgo.trace", "-ginkgo.showSpecProgress"},
    },
  },
}
