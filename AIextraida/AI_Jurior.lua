-- AI_Jurior.lua

ActionList =
{	
	-- 대기
	{
		ID	= "WAIT",
		Motion  = "Jurior_wait.frm",
		Func	= "Jurior_WaitFunc",

		Trigger =
		{
			-- 타게팅
			{
				AICheckFrame		= 25,
				AIFunc			= "Jurior_Check_Targeting",
				DelayFrame		= 110,
			},
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 15,
				AIFunc			= "Jurior_Check_TurnToTarget",
				DelayFrame		= 15,
			},
			-- 달리기
			{
				AICheckFrame	= 55,
				AIFunc			= "Jurior_Check_Walk",
				DelayFrame		= 111,
			},
			-- 판넬 레이저 돌진
			{
				AICheckFrame		= 110,
				AIFunc				= "Jurior_Check_Attack01",
				DelayFrame			= 330,
				DelayFrame1			= 220,
				DelayFrame2			= 110,
				DelayFrame3			= 110,
			},
			
			-- 냉기의 진주
			{
				AICheckFrame		= 100,
				AIFunc				= "Jurior_Check_Attack02",
				DelayFrame			= 110,
			},
			
			-- 냉기 회오리
			{
				AICheckFrame		= 125,
				AIFunc				= "Jurior_Check_Attack03",
				DelayFrame			= 750,
				DelayFrame1			= 500,
				DelayFrame2			= 250,
				DelayFrame3			= 250,
			},
			-- 저주의 조율
			{
				AICheckFrame		= 220,
				AIFunc				= "Jurior_Check_Attack04",
				DelayFrame			= 300,
			},
			-- 죽음의 조율
			{
				AICheckFrame		= 300,
				AIFunc				= "Jurior_Check_Attack07",
				DelayFrame			= 400,
			},
			-- 세이버투스 소환
			{
				AICheckFrame		= 220,
				AIFunc				= "Jurior_Check_Attack06",
				DelayFrame			= 1100,
				DelayFrame1			= 880,
				DelayFrame2			= 660,
				DelayFrame3			= 660,
			},
		},
	},
	--  걷기
	{
		ID	= "WALK",
		Motion  = "Jurior_Move.frm",
		Func	= "Jurior_WalkFunc",
		--EnableMoveCheck = 1,
		--MoveFailFunc	= "Jurior_MoveFail",

		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 35,
				AIFunc			= "Jurior_Check_TurnToTarget",
				DelayFrame		= 35,
			},
			-- 멈추기
			{
				AICheckFrame		= 10,
				AIFunc			= "Jurior_Check_RunStop",
				DelayFrame		= 55,
			},
			-- 대시 공격
			{
				AICheckFrame		= 75,
				AIFunc			= "Jurior_Check_Attack04",
				DelayFrame		= 110,
			},
		}
	},
	
	-- 저주의 조율 (왼)
	{
		ID	= "CurseStart_L",
		Motion  = "Jurior_Attack01_A_1.frm",
		Func	= "Jurior_CurseStartFunc",
	},
	
	-- 저주의 조율 (왼)
	{
		ID	= "CurseLeft_L",
		Motion  = "Jurior_Attack01_A_Left.frm",
		Func	= "Jurior_CurseLeftFunc",
	},
	
	-- 저주의 조율 (왼)
	{
		ID	= "CurseRight_L",
		Motion  = "Jurior_Attack01_A_Right.frm",
		Func	= "Jurior_CurseRightFunc",
	},
	
	-- 저주의 조율 (오)
	{
		ID	= "CurseStart_R",
		Motion  = "Jurior_Attack01_B_1.frm",
		Func	= "Jurior_CurseStartFunc",
	},
	
	-- 저주의 조율 (오)
	{
		ID	= "CurseLeft_R",
		Motion  = "Jurior_Attack01_B_Left.frm",
		Func	= "Jurior_CurseLeftFunc",
	},
	
	-- 저주의 조율 (오)
	{
		ID	= "CurseRight_R",
		Motion  = "Jurior_Attack01_B_Right.frm",
		Func	= "Jurior_CurseRightFunc",
	},
	
	-- 죽음의 조율 (왼)
	{
		ID	= "DeathStart_L",
		Motion  = "Jurior_Attack01_A_1.frm",
		Func	= "Jurior_DeathStartFunc",
	},
	
	-- 죽음의 조율 (왼)
	{
		ID	= "DeathLeft_L",
		Motion  = "Jurior_Attack01_A_Left.frm",
		Func	= "Jurior_DeathLeftFunc",
	},
	
	-- 죽음의 조율 (왼)
	{
		ID	= "DeathRight_L",
		Motion  = "Jurior_Attack01_A_Right.frm",
		Func	= "Jurior_DeathRightFunc",
	},
	
	-- 죽음의 조율 (오)
	{
		ID	= "DeathStart_R",
		Motion  = "Jurior_Attack01_B_1.frm",
		Func	= "Jurior_DeathStartFunc",
	},
	
	-- 죽음의 조율 (오)
	{
		ID	= "DeathLeft_R",
		Motion  = "Jurior_Attack01_B_Left.frm",
		Func	= "Jurior_DeathLeftFunc",
	},
	
	-- 죽음의 조율 (오)
	{
		ID	= "DeathRight_R",
		Motion  = "Jurior_Attack01_B_Right.frm",
		Func	= "Jurior_DeathRightFunc",
	},
	
	-- 판넬 찌르기
	{
		ID	= "ATTACK01",
		Motion  = "Jurior_Attack03.frm",
		Func	= "Jurior_Attack01Func",
	},
	
	-- 냉기의 진주
	{
		ID	= "ATTACK02",
		Motion  = "Jurior_Attack05.frm",
		Func	= "Jurior_Attack02Func",
	},
	
	-- 냉기 회오리
	{
		ID	= "ATTACK03",
		Motion  = "Jurior_Attack02.frm",
		Func	= "Jurior_Attack03Func",
	},
	
	-- 소환
	{
		ID	= "ATTACK06",
		Motion  = "Jurior_Attack04.frm",
		Func	= "Jurior_Attack06Func",
	},

	-- 데미지 중
	{
		ID	= "DAMAGE_MIDDLE",
		Motion  = "Jurior_Damage_Middle.frm",
		Func	= "Jurior_DamageFunc",
	},
	
	-- 데미지 하
	{
		ID	= "DAMAGE_DOWN",
		Motion  = "Jurior_damage_down.frm",
		Func	= "Jurior_DamageFunc",
	},
	
	-- 죽기01
	{
		ID	= "DIE",
		Motion  = "Jurior_Die.frm",
		Func	= "Jurior_DieFunc",
	},
}

CallBack =
{
	Land	= "OnJurior_Land",
	Die	= "OnJurior_Die",
	Damage  = "OnJurior_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitJurior( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
	pMonster:RegisterSummonMonsterType( MON_FREEZING_SABERTOOTH )
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Jurior_WaitFunc( iMonsterIndex, iFrame )

	g_kCamera.WideMode = 7
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame == 1 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if(pMonster:IsSuperArmor() == true) then
			--pMonster:SetSuperArmor( false )
		end		
		pMonster:SetState( "WAIT" )   		
	end
	
end

-- 걷기 상태
function Jurior_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end


-- 죽는상태
function Jurior_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999064)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
	end
end

-- 데미지 입은거
function Jurior_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Jurior_CurseStartFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetInvincible( true )
	local what
	pMonster:SetSpeedX( 0.0)
	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		what = pMonster:FloatRand()
		local posy = 0.65
		pMonster:AddParticle("Jurior_Weighing_Machine_01", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_02", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_03", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_04", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_05", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_06", 0.0, posy, true)
		pMonster:PlaySound(999060)
	end	
	
	if( pMonster:CheckState( "CurseStart_L" ) ) then
		if( iFrame == 2 ) then
			pMonster:PlaySound(999057)
			pMonster:SetTitleText(4485)
			pMonster:AddDamage(DT_JURIOR_BACKCOLOR1)
			-- 1이면 저주의 조율
			pMonster:SetCountValue(1)
			pMonster:PlaySound(999059)
		elseif( iFrame >= pMonster:GetLastFrame() ) then
			if( pMonster:FloatRand() <= 0.5 ) then
				pMonster:SetState( "CurseLeft_L" )
			else
				pMonster:SetState( "CurseRight_L" )
			end
		end
	
	elseif( pMonster:CheckState( "CurseStart_R" ) ) then
		if( iFrame == 2 ) then
			pMonster:PlaySound(999057)
			pMonster:SetTitleText(4485)
			pMonster:AddDamage(DT_JURIOR_BACKCOLOR1)
			-- 1이면 저주의 조율
			pMonster:SetCountValue(1)
			pMonster:PlaySound(999059)
		elseif( iFrame >= pMonster:GetLastFrame() ) then
			if( pMonster:FloatRand() <= 0.5 ) then
				pMonster:SetState( "CurseLeft_R" )
			else
				pMonster:SetState( "CurseRight_R" )
			end
		end
	end
end

function Jurior_CurseLeftFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetInvincible( true )
	pMonster:SetSpeedX( 0.0)
	
	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		pMonster:AddParticle("Jurior_Buff_01", 0.0, 0.65, true)
		pMonster:AddParticle("Jurior_Buff_02", 0.0, 0.65, true)
		pMonster:PlaySound(999061)
	elseif( iFrame == 39 ) then
		pMonster:AddDamage(DT_JURIOR_CURSE_PLUS_PLAYER)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetCountValue(0)
	end
end

function Jurior_CurseRightFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetInvincible( true )
	pMonster:SetSpeedX( 0.0)
	
	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		pMonster:AddParticle("Jurior_Curse_01", 0.0, 0.65, true)
		pMonster:AddParticle("Jurior_Curse_02", 0.0, 0.65, true)
		pMonster:PlaySound(999061)
	elseif( iFrame == 39 ) then
		pMonster:AddDamage(DT_JURIOR_CURSE_PLUS_BOSS)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetCountValue(0)
	end
end

function Jurior_DeathStartFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetInvincible( true )
	local what
	pMonster:SetSpeedX( 0.0)
	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		what = pMonster:FloatRand()
		local posy = 0.65
		pMonster:AddParticle("Jurior_Weighing_Machine_01", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_02", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_03", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_04", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_05", 0.0, posy, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_06", 0.0, posy, true)
		pMonster:PlaySound(999060)
	end	
	
	if( pMonster:CheckState( "DeathStart_L" ) ) then
		if( iFrame == 2 ) then
			-- 3이면 죽음의 조율
			pMonster:AddDamage(DT_JURIOR_BACKCOLOR2)
			pMonster:StartText("DANGER")
			pMonster:SetTitleText(4486)
			pMonster:SetCountValue(3)
			pMonster:PlaySound(999058)
		elseif( iFrame >= pMonster:GetLastFrame() ) then
			if( pMonster:FloatRand() <= 0.5 ) then
				pMonster:SetState( "DeathLeft_L" )
			else
				pMonster:SetState( "DeathRight_L" )
			end
		end
	
	elseif( pMonster:CheckState( "DeathStart_R" ) ) then
		if( iFrame == 2 ) then
			-- 3이면 죽음의 조율
			pMonster:AddDamage(DT_JURIOR_BACKCOLOR2)
			pMonster:StartText("DANGER")
			pMonster:SetTitleText(4486)
			pMonster:SetCountValue(3)
			pMonster:PlaySound(999058)
		elseif( iFrame >= pMonster:GetLastFrame() ) then
			if( pMonster:FloatRand() <= 0.5 ) then
				pMonster:SetState( "DeathLeft_R" )
			else
				pMonster:SetState( "DeathRight_R" )
			end
		end
	end
end

function Jurior_DeathLeftFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetInvincible( true )
	local particlePosY = 0.55
	pMonster:SetSpeedX( 0.0)
	
	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		pMonster:AddParticle("Jurior_Weighing_Machine_R_01", 0.0, 0.65, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_R_02", 0.0, 0.65, true)
		pMonster:PlaySound(999061)
	elseif( iFrame == 39 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 1.9, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		particlePosY = 0.55
	elseif( iFrame == 44 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 1.3, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		particlePosY = 0.55
	elseif( iFrame == 49 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 0.7, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
	elseif( iFrame == 54 ) then
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 0.1, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
		pMonster:PlaySound(999062)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetCountValue(0)
	end
end

function Jurior_DeathRightFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetInvincible( true )
	local particlePosY = 0.55
	pMonster:SetSpeedX( 0.0)
	
	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		pMonster:AddParticle("Jurior_Weighing_Machine_L_01", 0.0, 0.65, true)
		pMonster:AddParticle("Jurior_Weighing_Machine_L_02", 0.0, 0.65, true)
		pMonster:PlaySound(999061)
	elseif( iFrame == 39 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 2.6, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
	elseif( iFrame == 44 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 3.2, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
	elseif( iFrame == 49 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 3.8, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
	elseif( iFrame == 54 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_JURIOR_DEATH, 4.4, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetCountValue(0)
	end
end

-- 판넬 레이저
function Jurior_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 3 ) then
		pMonster:PlaySound(999049)
    elseif( iFrame == 45 ) then
		
		local bone = 25
		for i = 0, 4 do
			if( i == 1 ) then
				bone = 28
			elseif( i == 2 ) then
				bone = 31
			elseif( i == 3 ) then
				bone = 34
			end
				
			pMonster:AddTraceParticleToBone( "Jurior_Laser_01", 1.0, bone, 0, 0, 0.0, -0.45 )
			pMonster:AddTraceParticleToBone( "Jurior_Laser_02", 1.0, bone, 0, 0, 0.0, -0.45 )
			pMonster:AddTraceParticleToBone( "Jurior_Laser_03", 1.0, bone, 0, 0, 0.0, -0.45 )
			pMonster:AddTraceParticleToBone( "Jurior_Laser_04", 1.0, bone, 0, 0, 0.0, -0.45 )
		end
		
		pMonster:AddDamage(DT_JURIOR_LASER)
	elseif( iFrame == 56 ) then
		pMonster:PlaySound(999050) -- 레이조뷤~
		--25 28 31 34
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 냉기의 진주
function Jurior_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 3 ) then
		pMonster:PlaySound(999046)
    elseif( iFrame == 84 ) then
		pMonster:PlaySound(999047) -- 발사
	    for i = 0, 9 do
	        pMonster:AddDamageWithLocateAngle( DT_JURIOR_PEARL_MISSILE, 0.0, 0.0, false, -0.0 + i * 0.7 )
	    end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 냉기 회오리
function Jurior_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 3 ) then
		pMonster:PlaySound(999054)
	elseif( iFrame == 70 ) then
		pMonster:PlaySound(999055) -- 마법진
    elseif( iFrame == 84 ) then
		pMonster:PlaySound(999056) -- 발사
		
		local posX = 1.9
		local posY = 0.4
		
		for i = 0, 6 do
			local randX = pMonster:FloatRand() / 2
			local randY = pMonster:FloatRand() / 4
			if( i == 1 ) then
				posX = 0.5 + randX
				posY = -0.4 + randY
			elseif( i == 2 ) then
				posX = -0.4 + randX
				posY = 0.2 + randY
			elseif( i == 3 ) then
				posX = -1.2 + randX
				posY = -0.4 + randY
			elseif( i == 4 ) then
				posX = 3.0 + randX
				posY = 0.4 + randY
			elseif( i == 5 ) then
				posX = -2.7 + randX
				posY = -0.4 + randY
			end
	        pMonster:AddParticle( "Jurior_Whirlpool01", posX, posY )	--소용돌이01
			pMonster:AddParticle( "Jurior_Whirlpool02", posX, posY )	--소용돌이01
			pMonster:AddDamageWithLocate( DT_JURIOR_TONADO1, posX, posY + 0.1)	--소용돌이01
			pMonster:AddDamageWithLocate( DT_JURIOR_TONADO1, posX, posY + 0.5 )	--소용돌이01
			pMonster:AddDamageWithLocate( DT_JURIOR_TONADO2, posX, posY + 0.9  ) --소용돌이01
	    end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 세이버 투스 소환
function Jurior_Attack06Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 3 ) then
		pMonster:PlaySound(999052)
	elseif( iFrame == 55 ) then
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_FREEZING_SABERTOOTH
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
        
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_FREEZING_SABERTOOTH
        pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame == 56 ) then
		pMonster:PlaySound(999053)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Jurior_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2024, 800, 2024, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function Jurior_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Jurior_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -500, 400, 500, -200 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
	
	if( math.mod(iFrame, 40) == 0 ) then
		pMonster:PlaySound(999045)
	end
end

function Jurior_Check_RunStop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 450, -350, 600, 350, -800 ) == false ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
	end
end

function Jurior_CheckDownUp02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Jurior_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 80, -750, 800, 750, -800 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Jurior_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 0, -400, 900, 400 -800 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Jurior_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 440, -250, 600, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Jurior_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 400, -350, 600, 350, -100 ) == true ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetState( "CurseStart_R" )
		else
			pMonster:SetState( "CurseStart_L" )
		end
		
		pMonster:ResetDelay()
	end
end

function Jurior_Check_Attack07( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 400, -350, 600, 350, -100 ) == true ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetState( "DeathStart_R" )
		else
			pMonster:SetState( "DeathStart_L" )
		end
		
		pMonster:ResetDelay()
	end
end

function Jurior_Check_Attack06( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:GetSummonedMonsterCount() < 1 and pMonster:GetX() >= 0.5 and pMonster:GetX() <= 2.1 ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnJurior_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
    pMonster:CameraVib( 1, 1.2, 0.1 )    
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true or pMonster:CheckState( "JUMPMOVE" ) == true or pMonster:CheckState( "JUMPMOVEATTACK" ) == true or pMonster:CheckState( "AERIALAVOID" ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )	
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )	
	end
end

function OnJurior_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnJurior_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false ) then	
		local fRand = pMonster:FloatRand()
		if ( fRand < 0.5 ) then
			pMonster:SetState( "ATTACK01" )
		elseif ( fRand >= 0.5 and fRand < 0.75 ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "ATTACK03" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
end

function Jurior_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2024, 800, 2024, -800 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WAIT" )
	end
end
