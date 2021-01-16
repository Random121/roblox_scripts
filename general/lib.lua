local lib = {}

local str_match = string.match
local str_sub = string.sub
local str_gmatch = string.gmatch
local math_random = math.random
local os_clock = os.clock

local ALPHA_NUM = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K",
    "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j",
    "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}

local function lib.trim(str)
    return str_match(str, "^%s*(.-)%s*$")
end

local function lib.split(str, sep)
    if sep == nil or sep == '' then
        return {str}
    end
    local words = {}
    for v in str_gmatch(str,"[^"..sep.."]+") do
		words[#words+1] = v
    end
    return words
end

local function lib.startsWith(str, search)
    return str_sub(str, 1, #search) == search
end

local function lib.randomString(len)
    if len == nil or len <= 0 then return '' end
    return lib.randomString(len - 1)..ALPHA_NUM[math_random(1, #ALPHA_NUM)]
end

return lib
