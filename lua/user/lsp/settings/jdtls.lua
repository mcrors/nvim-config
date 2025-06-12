local util = require 'lspconfig/util'

return {
  cmd = {
        'java',
        '-javaagent:/Users/rhoulihan/.m2/repository/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar', -- Add this
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '-jar', '/Users/rhoulihan/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
        '-configuration', '/Users/rhoulihan/.local/share/nvim/mason/packages/jdtls/config_mac_arm',
        '-data', vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  },
  filetypes = {'java'},
  root_dir = function(fname)
    return util.root_pattern('pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
  end,
  settings = {
    java = {
      format = {
        settings = {
          url = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml',
          profile = 'GoogleStyle'
        }
      },
      imports = {
        gradle = {
          wrapper = {
            checksums = {
              sha256 = '9a9afff59390e0cab2134d6113690dc6e25eb6b3b16b1288b441c4cbdfd97a09',
              allowed = true
            }
          }
        }
      }
    },
  },
  init_options = {
    bundles = {}
  }
}
