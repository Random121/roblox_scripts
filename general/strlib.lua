local StrLib = {}

local str_match = string.match
local str_sub = string.sub
local str_gmatch = string.gmatch
local tbl_concat = table.concat
local math_random = math.random

local ALPHA_NUM = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K",
    "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j",
    "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}

local function StrLib.trim(string)
    return str_match(string, "^%s*(.-)%s*$")
end

local function StrLib.split(string, seperator)
    if seperator == nil or seperator == '' then
        return {string}
    end
    local words = {}
    for v in str_gmatch(string,"[^"..seperator.."]+") do
		words[#words+1] = v
    end
    return words
end

local function StrLib.startsWith(string, search)
    return str_sub(string, 1, #search) == search
end

local function StrLib.endsWith(string, search)
    return str_sub(string, -#search) == search
end

local function StrLib.random(length)
    if length == nil or length <= 0 then
        return ''
    end
    local chars = {}
    for i = 1, length do
        chars[i] = ALPHA_NUM[math_random(1, 62)]
    end
    return tbl_concat(chars)
end

local function StrLib.charAt(string, position)
    return str_sub(string, position, position)
end

return StrLib
