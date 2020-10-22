AddCSLuaFile()

ENT.Base = "nz_zombiebase"
ENT.PrintName = "Walker"
ENT.Category = "Brainz"
ENT.Author = "Lolle"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EmergeSequenceIndex")
	self:NetworkVar("Bool", 1, "Decapitated")
end

ENT.Models = NZOMBIES_VARS.MODELS.NZ_ZOMBIE.ZOMBIE_RERIG_ANIMATED

local AttackSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.AttackSequences
local WalkAttackSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.WalkAttackSequences
local RunAttackSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.RunAttackSequences

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

local JumpSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.JumpSequences
local SprintJumpSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.SprintJumpSequences

ENT.ActStages = {
	[1] = {
		act = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_WALK,
		minspeed = 5,
		attackanims = WalkAttackSequences,
		-- no attackhitsounds, just use ENT.AttackHitSounds for all act stages
		sounds = WalkSounds,
		barricadejumps = JumpSequences,
	},
	[2] = {
		act = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_WALK_ANGRY,
		minspeed = 40,
		attackanims = WalkAttackSequences,
		sounds = WalkSounds,
		barricadejumps = JumpSequences,
	},
	[3] = {
		act = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_RUN,
		minspeed = 100,
		attackanims = RunAttackSequences,
		sounds = RunSounds,
		barricadejumps = SprintJumpSequences,
	},
	[4] = {
		act = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_SPRINT,
		minspeed = 160,
		attackanims = RunAttackSequences,
		sounds = RunSounds,
		barricadejumps = SprintJumpSequences,
	},
}

ENT.RedEyes = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.RED_EYES

ENT.ElectrocutionSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ElectrocutionSequences
ENT.EmergeSequences = NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.EmergeSequences
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
			if string.find(self:GetSequenceName(self:GetSequence()), NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.EmergeBase) then
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
