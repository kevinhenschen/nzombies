AddCSLuaFile()

ENT.Base = "nz_zombiebase"
ENT.PrintName = "Walker"
ENT.Category = "Brainz"
ENT.Author = "Lolle"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EmergeSequenceIndex")
	self:NetworkVar("Bool", 1, "Decapitated")
end

ENT.Models = {
	"models/nz_zombie/zombie_rerig_animated.mdl",
}

local AttackSequences = {
	{seq = "nz_stand_attack1", dmgtimes = {0.75, 1.25}},
	{seq = "nz_stand_attack2", dmgtimes = {0.3}},
	{seq = "nz_stand_attack3", dmgtimes = {0.8}},
	{seq = "nz_stand_attack4", dmgtimes = {0.4, 0.8}},
}
local WalkAttackSequences = {
	{seq = "nz_walk_attack1", dmgtimes = {0.3}},
	{seq = "nz_walk_attack2", dmgtimes = {0.4, 0.9}},
	{seq = "nz_walk_attack3", dmgtimes = {0.5}},
	{seq = "nz_walk_attack4", dmgtimes = {0.4, 0.75}},
}
local RunAttackSequences = {
	{seq = "nz_run_attack1", dmgtimes = {0.3}},
	{seq = "nz_run_attack2", dmgtimes = {0.3, 0.65}},
	{seq = "nz_run_attack3", dmgtimes = {0.3, 0.7}},
	{seq = "nz_run_attack4", dmgtimes = {0.3, 0.8}},
}

local AttackSounds = {
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_00,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_01,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_02,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_03,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_04,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_05,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_06,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_07,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_08,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_09,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_10,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_11,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_12,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_13,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_14,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_15,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_16,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_17,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_18,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_19,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_20,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_21,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.ATTACK.ATTACK_22,
}

local WalkSounds = {
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_00,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_01,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_02,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_03,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_04,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_05,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_06,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_07,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_08,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_09,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_10,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_11,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_12,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_13,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_14,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_15,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_16,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_17,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_18,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_19,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.AMBIENT.AMBIENT_20
}

local RunSounds = {
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT0,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT1,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT2,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT3,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT4,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT5,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT6,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT7,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.SPRINT2.SPRINT8
}

local JumpSequences = {
	{seq = "nz_barricade1", speed = 15, time = 2.7},
	{seq = "nz_barricade2", speed = 15, time = 2.4},
	{seq = "nz_barricade_fast1", speed = 15, time = 1.8},
	{seq = "nz_barricade_fast2", speed = 35, time = 4},
}
local SprintJumpSequences = {
	{seq = "nz_barricade_sprint1", speed = 50, time = 1.9},
	{seq = "nz_barricade_sprint2", speed = 35, time = 1.9},
}

ENT.ActStages = {
	[1] = {
		act = ACT_WALK,
		minspeed = 5,
		attackanims = WalkAttackSequences,
		-- no attackhitsounds, just use ENT.AttackHitSounds for all act stages
		sounds = WalkSounds,
		barricadejumps = JumpSequences,
	},
	[2] = {
		act = ACT_WALK_ANGRY,
		minspeed = 40,
		attackanims = WalkAttackSequences,
		sounds = WalkSounds,
		barricadejumps = JumpSequences,
	},
	[3] = {
		act = ACT_RUN,
		minspeed = 100,
		attackanims = RunAttackSequences,
		sounds = RunSounds,
		barricadejumps = SprintJumpSequences,
	},
	[4] = {
		act = ACT_SPRINT,
		minspeed = 160,
		attackanims = RunAttackSequences,
		sounds = RunSounds,
		barricadejumps = SprintJumpSequences,
	},
}

ENT.RedEyes = true

ENT.ElectrocutionSequences = {
	"nz_electrocuted1",
	"nz_electrocuted2",
	"nz_electrocuted3",
	"nz_electrocuted4",
	"nz_electrocuted5",
}
ENT.EmergeSequences = {
	"nz_emerge1",
	"nz_emerge2",
	"nz_emerge3",
	"nz_emerge4",
	"nz_emerge5",
}
ENT.AttackHitSounds = {
	"npc/zombie/zombie_hit.wav"
}
ENT.PainSounds = {
	"physics/flesh/flesh_impact_bullet1.wav",
	"physics/flesh/flesh_impact_bullet2.wav",
	"physics/flesh/flesh_impact_bullet3.wav",
	"physics/flesh/flesh_impact_bullet4.wav",
	"physics/flesh/flesh_impact_bullet5.wav"
}
ENT.DeathSounds = {
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_00,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_01,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_02,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_03,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_04,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_05,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_06,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_07,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_08,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_09,
	NZOMBIES_VARS.SOUND.NZ.ZOMBIES.DEATH.DEATH_10
}

function ENT:StatsInitialize()
	if SERVER then
		if nzRound:GetNumber() == -1 then
			self:SetRunSpeed( math.random(30, 300) )
			self:SetHealth( math.random(100, 1500) )
		else
			local speeds = nzRound:GetZombieSpeeds()
			if speeds then
				self:SetRunSpeed( nzMisc.WeightedRandom(speeds) )
			else
				self:SetRunSpeed( 100 )
			end
			self:SetHealth( nzRound:GetZombieHealth() or 75 )
		end

		--Preselect the emerge sequnces for clientside use
		self:SetEmergeSequenceIndex(math.random(#self.EmergeSequences))
	end
end

function ENT:SpecialInit()

	if CLIENT then
		--make them invisible for a really short duration to blend the emerge sequences
		self:TimedEvent(0.1, function() -- Tiny delay just to make sure they are fully initialized
			if string.find(self:GetSequenceName(self:GetSequence()), "nz_emerge") then
				self:SetNoDraw(true)
				self:TimedEvent( 0.15, function()
					self:SetNoDraw(false)
				end)

				self:SetRenderClipPlaneEnabled( true )
				self:SetRenderClipPlane(self:GetUp(), self:GetUp():Dot(self:GetPos()))

				--local _, dur = self:LookupSequence(self.EmergeSequences[self:GetEmergeSequenceIndex()])
				local _, dur = self:LookupSequence(self.EmergeSequences[self:GetEmergeSequenceIndex()])
				dur = dur - (dur * self:GetCycle()) -- Subtract the time we are already thruogh the animation
				-- The above is important if the zombie only appears in PVS mid-way through the animation

				self:TimedEvent( dur, function()
					self:SetRenderClipPlaneEnabled(false)
				end)
			end
		end)

	end
end

function ENT:OnSpawn()

	local seq = self.EmergeSequences[self:GetEmergeSequenceIndex()]
	local _, dur = self:LookupSequence(seq)

	--dust cloud
	local effectData = EffectData()
	effectData:SetStart( self:GetPos() )
	effectData:SetOrigin( self:GetPos() )
	effectData:SetMagnitude(dur)
	util.Effect("zombie_spawn_dust", effectData)

	-- play emerge animation on spawn
	-- if we have a coroutine else just spawn the zombie without emerging for now.
	if coroutine.running() then
		self:PlaySequenceAndWait(seq)
	end
end

function ENT:OnZombieDeath(dmgInfo)

	if dmgInfo:GetDamageType() == DMG_SHOCK then
		self:SetRunSpeed(0)
		self.loco:SetVelocity(Vector(0,0,0))
		self:Stop()
		local seq, dur = self:LookupSequence(self.ElectrocutionSequences[math.random(#self.ElectrocutionSequences)])
		self:ResetSequence(seq)
		self:SetCycle(0)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		-- Emit electrocution scream here when added
		timer.Simple(dur, function()
			if IsValid(self) then
				self:BecomeRagdoll(dmgInfo)
			end
		end)
	else
		self:EmitSound( self.DeathSounds[ math.random( #self.DeathSounds ) ], 100)
		self:BecomeRagdoll(dmgInfo)
	end

end
