local results = {}

-- vim.split can also be for spliting words in a string
-- local function split(inputstr, sep) sep=sep or '%s' local t={}  for field,s in string.gmatch(inputstr, "([^"..sep.."]*)("..sep.."?)") do table.insert(t,field)  if s=="" then return t end end end

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end



local function onread(err, data)
  if err then
    -- TODO handle err
    print('ERROR: ', err)
  end
  if data then
    local vals = vim.split(data, "\n")
    for _, d in pairs(vals) do
      if d == "" then goto continue end
      table.insert(results, d)
      ::continue::
    end
  end
end


local function run_command(cmd, cmdArgs)
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)

  local function print_results()
    print("dumping:")
    print(dump(results))
  end

  handle = vim.loop.spawn(
    cmd,
    {
      args = vim.split(cmdArgs, " "),
      stdio = {nil, stdout, stderr}
    },
    vim.schedule_wrap(function ()
      stdout:read_stop()
      stderr:read_stop()
      stdout:close()
      stderr:close()
      handle:close()
      print_results()
    end)
  )
  vim.loop.read_start(stdout, onread)
  vim.loop.read_start(stderr, onread)
end


-- run_command("ls", "-l -a -h")


