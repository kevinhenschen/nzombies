NZOMBIES_VARS = NZOMBIES_VARS or {}
NZOMBIES_VARS.MOVEMENTS = {} 
NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER = {} 

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.AttackSequences = {
	{seq = "nz_stand_attack1", dmgtimes = {0.75, 1.25}},
	{seq = "nz_stand_attack2", dmgtimes = {0.3}},
	{seq = "nz_stand_attack3", dmgtimes = {0.8}},
	{seq = "nz_stand_attack4", dmgtimes = {0.4, 0.8}},
}
NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.WalkAttackSequences = {
	{seq = "nz_walk_attack1", dmgtimes = {0.3}},
	{seq = "nz_walk_attack2", dmgtimes = {0.4, 0.9}},
	{seq = "nz_walk_attack3", dmgtimes = {0.5}},
	{seq = "nz_walk_attack4", dmgtimes = {0.4, 0.75}},
}
NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.RunAttackSequences = {
	{seq = "nz_run_attack1", dmgtimes = {0.3}},
	{seq = "nz_run_attack2", dmgtimes = {0.3, 0.65}},
	{seq = "nz_run_attack3", dmgtimes = {0.3, 0.7}},
	{seq = "nz_run_attack4", dmgtimes = {0.3, 0.8}},
}

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.JumpSequences = {
	{seq = "nz_barricade1", speed = 15, time = 2.7},
	{seq = "nz_barricade2", speed = 15, time = 2.4},
	{seq = "nz_barricade_fast1", speed = 15, time = 1.8},
	{seq = "nz_barricade_fast2", speed = 35, time = 4},
}

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.SprintJumpSequences = {
	{seq = "nz_barricade_sprint1", speed = 50, time = 1.9},
	{seq = "nz_barricade_sprint2", speed = 35, time = 1.9},
}

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.EmergeBase = "nz_emerge"

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.EmergeSequences = {
	"nz_emerge1",
	"nz_emerge2",
	"nz_emerge3",
	"nz_emerge4",
	"nz_emerge5",
}

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ElectrocutionSequences = {
	"nz_electrocuted1",
	"nz_electrocuted2",
	"nz_electrocuted3",
	"nz_electrocuted4",
	"nz_electrocuted5",
}

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_WALK = ACT_WALK;
NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_WALK_ANGRY = ACT_WALK_ANGRY;
NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_RUN = ACT_RUN;
NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.ACT_SPRINT = ACT_SPRINT;

NZOMBIES_VARS.MOVEMENTS.ZOMBIE_WALKER.RED_EYES = true;