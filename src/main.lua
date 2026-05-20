--[[ 
	MAIN MAP INITIALIZER - Orchestrates all map components
	This is the PRIMARY SCRIPT - run this first!
]]

-- Import all modules
local MapConfig = require(script:WaitForChild("config").MapConfig)
local BuildingUtils = require(script:WaitForChild("buildings").BuildingUtils)

-- Function to initialize entire map
local function InitializeMap()
	print("🏗️ Initializing Morocco Vibes Map...")
	
	-- Create terrain base
	print("📍 Creating terrain...")
	local TerrainGenerator = require(script:WaitForChild("terrain").TerrainGenerator)
	TerrainGenerator(workspace)
	wait(0.5)
	
	-- Create decorations
	print("🌴 Adding decorations...")
	local Decorations = require(script:WaitForChild("terrain").Decorations)
	Decorations(workspace)
	wait(0.5)
	
	-- Create buildings
	print("🏢 Building structures...")
	local MainBuilding = require(script:WaitForChild("buildings").MainBuilding)
	MainBuilding(workspace)
	wait(0.5)
	
	local SecondaryBuilding = require(script:WaitForChild("buildings").SecondaryBuilding)
	SecondaryBuilding(workspace)
	wait(0.5)
	
	-- Create interactive zones
	print("🎯 Setting up zones...")
	local InteractiveZones = require(script:WaitForChild("zones").InteractiveZones)
	InteractiveZones(workspace)
	wait(0.5)
	
	-- Create effects
	print("✨ Applying effects...")
	local Effects = require(script:WaitForChild("zones").Effects)
	Effects(workspace)
	wait(0.5)
	
	print("✅ Map initialization complete!")
	print("📋 Current Map Config:")
	print("  - Neon Enabled:", MapConfig.Neon.Enabled)
	print("  - Building Color:", MapConfig.Colors.PrimaryBuilding)
	print("  - Spawn Point:", MapConfig.Zones.SpawnPoint)
	
	return true
end

-- Run initialization when script loads
if game:IsLoaded() then
	InitializeMap()
else
	game.Loaded:Connect(InitializeMap)
end

return InitializeMap
