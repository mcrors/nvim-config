local default_schemas = nil

local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
  default_schemas = jsonls_settings.get_default_schemas()
end

local schemas = {
  {
    description = "Packer template JSON configuration",
    fileMatch = {
      "packer.json",
    },
    url = "https://json.schemastore.org/packer.json",
  },
  {
    description = "NPM configuration file",
    fileMatch = {
      "package.json",
    },
    url = "https://json.schemastore.org/package.json",
  },
  {
      description = "pyrightconfig JSON schema",
      fileMatch = {
        "pyrightconfig.json"
      },
      url="https://github.com/fannheyward/coc-pyright/blob/master/schemas/pyrightconfig.schema.json"
  }
}

local function extend(tab1, tab2)
  for _, value in ipairs(tab2 or {}) do
    table.insert(tab1, value)
  end
  return tab1
end

local extended_schemas = extend(schemas, default_schemas)

return {
    json = {
        schemas = extended_schemas
    }
}
