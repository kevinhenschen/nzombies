-- Load all our files in to the respective realms

-- Main Tables
nz = nz or {}
function AddNZModule(id)
	local tbl = {}
	--nz[id] = tbl -- Enabling this line will make all tables parented to nz again
	return tbl
end

local gmfolder = "nzombies"

local _,dirs = file.Find( gmfolder.."/gamemode/*", "LUA" )

local loaded_map = game.GetMap();
local corrected_map = string.Explode("_", loaded_map);
local raw_map = '';
for _,v in ipairs(corrected_map) do raw_map = raw_map .. v end

local customconfig = {};
customconfig['mat'] = "Materials";
customconfig['lang'] = "Language";
customconfig['snd'] = "Sound";
customconfig['mdl'] = "Models";
customconfig['move'] = "Move";

local defaultconfig = {};
for k,v in pairs(customconfig) do
	defaultconfig[k] = {}
	defaultconfig[k]["default"] = gmfolder.. '/gamemode/customconfig/default/sh_cnf_' .. k .. '_default.lua'
	defaultconfig[k]["rewrite"] = defaultconfig[k]["default"];

	if SERVER then
		AddCSLuaFile(defaultconfig[k]["default"])
		include(defaultconfig[k]["default"])
	else
		include(defaultconfig[k]["default"])
	end

end

local customconfigraw = '';
for k,v in pairs(customconfig) do customconfigraw = customconfigraw .. k .. ' [' .. v .. '] /' end

print("----------------------------")
print("nZombies Loading...")
print("Current Map : " .. loaded_map)
print("To Custom Config : " .. gmfolder.. '/gamemode/customconfig/' .. raw_map ..'/sh_cnf_(x).lua [(x) = ' .. customconfigraw .. ']' )
print("----------------------------")

function AutoInclude(name, dir)

	local sep = string.Explode("_", name)
	name = dir..name

	if sep[1] == "cl" and SERVER then
		print("Sending: "..name)
	else
		print("Including: "..name)
	end

	-- Determine where to load the files
	if sep[1] == "sv" then
		if SERVER then
			include(name)
		end
	elseif sep[1] == "sh" then
		if SERVER then
			AddCSLuaFile(name)
			include(name)
		else
			include(name)
		end
	elseif sep[1] == "cl" then
		if SERVER then
			AddCSLuaFile(name)
		else
			include(name)
		end
	end
end

-- Run this on both client and server

local customConfig = file.Find(gmfolder.."/gamemode/customconfig/" .. raw_map .. '/*', "LUA");

print("--------------------------")

for k,v in ipairs(customConfig) do
	local f = gmfolder.."/gamemode/customconfig/" .. raw_map .. '/' .. v;
	local raw = string.Explode("_", f);

	print(raw[3])

	if(raw[2] == 'cnf') then
		local r = string.Explode(".", raw[3])
		print(r[1])
		if defaultconfig[r[1]] then
			defaultconfig[r[1]]["rewrite"] = f;
		end
	end
end

for k,v in pairs(defaultconfig) do
	if(v["default"] and v["rewrite"] and (v["default"] != v["rewrite"])) then
		print("REWRITE !!! : " .. v["rewrite"])
		if SERVER then
			AddCSLuaFile(v["rewrite"])
			include(v["rewrite"])
		else
			include(v["rewrite"])
		end
	end
end

print("--------------------------")



if SERVER then print(" ** Server List **") else print(" ** Client List **") end
for k,v in pairs(dirs) do
	local f2,d2 = file.Find( gmfolder.."/gamemode/"..v.."/*", "LUA" )

	-- Load construction file before everything else
	if table.HasValue(f2, "sh_constructor.lua") then
		print("Constructing: " .. v)
		AutoInclude("sh_constructor.lua", v.."/")
	end

	for k2,v2 in pairs(f2) do
		-- we already loaded the construction file once, so dont load again
		if v2 != "sh_constructor.lua" then
			AutoInclude(v2, v.."/")
		end
	end

end
print(" ** End List **")