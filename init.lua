-- Global Mapper for map bmxxx to real string
mapper = {
  bmwfi = "bluemix wait for your info",
  bmcon = "contact",
 }

 buffer = "" --global buffer(string) to record customer typing

-- this func will create enough backspace char, plus the to-be-str
local function createRep(buf)
	for k,v in pairs(mapper) do
		local startp, endp = string.find(buf,k)
		if startp~=nil or endp~=nil then
			if startp>0 and endp>startp then
				return string.rep("\b",string.len(k)) .. v;
			end
		end
	end
end

--this func will create a max 10 char buffer(which is the key) for us to use
local function monitorBuf(char)
	if string.byte(char) > 31 and string.byte(char) <127 then
		buffer = buffer .. char -- append char to the end
	elseif string.byte(char)==8 then
		buffer = string.sub(buffer,1,string.len(buffer)-1)  --backspace
	end

	--keep the buf size under 10
	if string.len(buffer) > 10 then
		buffer = string.sub(buffer,2)
	end

	--print(buffer)
end


--[[
simulate keyUP
monitorBuf("a")
monitorBuf("b")
monitorBuf("c")
monitorBuf("d")
monitorBuf("e")
monitorBuf("f")
monitorBuf("g")
monitorBuf("h")
monitorBuf("i")
monitorBuf("j")
monitorBuf("k")
--monitorBuf("\b")
monitorBuf("b")
monitorBuf("m")
monitorBuf("w")
monitorBuf("f")
monitorBuf("i")
--]]


--print (createRep("hellobmwfi"))
print(buffer)
print (createRep(buffer))
-- for k,v  in pairs(mapper) do
--	print (k,v)
-- end

