local M = {}
local function parse_and_execute_http_request(lines, verbose, debug)
    local method, url, headers, body
    headers = {}
    body = ""

    -- Parse lines to extract HTTP request details
    local in_body = false
    for _, line in ipairs(lines) do
        if not in_body then
            if line:match("^%s*(%u+)%s+(http.+)$") then
                method, url = line:match("^%s*(%u+)%s+(http.+)$")
            elseif line:match("^%s*([%w-]+)%s*:%s*(.+)$") then
                local header, value = line:match("^%s*([%w-]+)%s*:%s*(.+)$")
                table.insert(headers, string.format('-H "%s: %s"', header, value))
            elseif line:match("^%s*{") then
                in_body = true
                body = body .. line
            end
        else
            if line:match("^%s*}$") then
                in_body = false
            end
            body = body .. line
        end
    end

    if not method or not url then
        print("Error: Invalid HTTP request block.")
        return
    end
    -- Construct curl command
    local curl_command = 'curl -s -X ' .. method .. ' "' .. url .. '"'
    if headers then
        curl_command = curl_command .. " " .. table.concat(headers, " ")
    end
    if body and body ~= "" then
        curl_command = curl_command .. ' -d "' .. body:gsub('"', '\\"') .. '"'
    end
    if verbose then
        curl_command = curl_command .. " -v"
    end
    if debug then
        print(curl_command)
    end

    -- Execute curl command in a new split
    vim.cmd("vsplit")
    vim.cmd("term " .. curl_command .. " | jq")
end

function M.execute_http_request_from_visual(verbose, debug)
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local total_lines = vim.api.nvim_buf_line_count(0)
    local current_line = cursor_pos[1]

    -- Find the start of the current block
    local start_line = current_line
    while start_line > 1 do
        local line = vim.api.nvim_buf_get_lines(0, start_line - 2, start_line - 1, false)[1]
        if line:match("^###") then
            break
        end
        start_line = start_line - 1
    end

    -- Find the end of the current block
    local end_line = current_line
    while end_line <= total_lines do
        local line = vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, false)[1]
        if line:match("^###") and end_line ~= current_line then
            break
        end
        end_line = end_line + 1
    end

    if start_line == end_line then
        print("Error: No HTTP request block found.")
        return
    end

    -- Get the lines of the current block
    parse_and_execute_http_request(vim.api.nvim_buf_get_lines(0, start_line - 1, end_line - 1, false), verbose, debug)
end
return M
