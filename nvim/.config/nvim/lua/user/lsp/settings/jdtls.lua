return {
  settings = {
    java = {
      format = {
        settings = {
          url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      imports = {
        gradle = {
          wrapper = {
            checksums = {
              sha256 = "9a9afff59390e0cab2134d6113690dc6e25eb6b3b16b1288b441c4cbdfd97a09",
              allowed = true,
            },
          },
        },
        maven = { enabled = true },
        enabled = true,
        exclusions = {
          "java.awt.List",
        },
      },
      compiler = {
        processAnnotations = true,
      },
    },
  },
}
