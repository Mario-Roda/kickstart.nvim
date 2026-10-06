local M = {}

function M.setup()
  vim.api.nvim_create_user_command('BuildProject', function()
    -- Search upward from the current working directory for a .sln file
    local sln = vim.fs.find(function(name)
      return name:match('%.sln$') ~= nil
    end, {
      upward = true,
      type = 'file',
      path = vim.fn.getcwd(),
    })[1]

    if not sln then
      print("No .sln file found upward from " .. vim.fn.getcwd())
      return
    end

    print("Building: " .. sln)
    vim.cmd('!MSBuild.exe "' .. sln .. '" /p:Configuration=Debug /p:Platform=x64 && call "x64\\Debug\\GraphApplication.exe"')
  end, {})
end

return M
