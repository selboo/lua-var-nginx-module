local function test1()
    local start_time = ngx.now()

    local var = ngx.var
    local uri
    for i = 1, 10000 * 1000 do
        uri = var.uri
        if not uri then
            uri = uri .. "xxx"
        end
    end

    ngx.update_time()
    ngx.say("ngx.var directly, uri used time: ", ngx.now() - start_time)
end

local function test2()
    local start_time = ngx.now()

    local ngxvar = require("resty.ngxvar").fetch
    local req = ngxvar("_request")
    local uri

    for i = 1, 10000 * 1000 do
        uri = ngxvar("uri", req)
        if not uri then
            uri = uri .. "xxx"
        end
    end

    ngx.update_time()
    ngx.say("ngxvar patch, uri used time: ", ngx.now() - start_time)
end

test1()
test2()

local function test3()
    local start_time = ngx.now()

    local var = ngx.var
    local server_name
    for i = 1, 10000 * 1000 do
        server_name = var.server_name
        if not server_name then
            server_name = server_name .. "xxx"
        end
    end

    ngx.update_time()
    ngx.say("ngx.var directly, server_name used time: ", ngx.now() - start_time)
end

local function test4()
    local start_time = ngx.now()

    local ngxvar = require("resty.ngxvar").fetch
    local req = ngxvar("_request")
    local server_name

    for i = 1, 10000 * 1000 do
        server_name = ngxvar("server_name", req)
        if not server_name then
            server_name = server_name .. "xxx"
        end
    end

    ngx.update_time()
    ngx.say("ngxvar patch, server_name used time: ", ngx.now() - start_time)
end

test3()
test4()

