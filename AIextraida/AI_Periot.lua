-- AI_Periot.lua

ActionList =
{	
	-- 대기
	{
		ID	= "WAIT",
		Motion  = "Periot_Wait.frm",
		Func	= "Periot_WaitFunc",

		Trigger =
		{
			-- 타게팅
			{
				AICheckFrame		= 25,
				AIFunc			= "Periot_Check_Targeting",
				DelayFrame		= 110,
			},

			-- 타겟을 향해 턴
			{
				AICheckFrame		= 15,
				AIFunc			= "Periot_Check_TurnToTarget",
				DelayFrame		= 30,
			},

			-- 달리기
			{
				AICheckFrame	= 35,
				AIFunc			= "Periot_Check_Run",
				DelayFrame		= 130,
			},

			-- 잡아먹기
			{
				AICheckFrame		= 444,
				AIFunc				= "Periot_Check_Attack01",
				DelayFrame			= 3300,
				DelayFrame1			= 2200,
				DelayFrame2			= 1100,
				DelayFrame3			= 1100,
			},

			-- 잡아먹기 위험
			{
				AICheckFrame		= 99999,
				AICheckFrame1       = 300,
				AICheckFrame2       = 10,
				AICheckFrame3       = 10,
				AIFunc				= "Periot_Check_Attack01_2",
				DelayFrame			= 9999,
				DelayFrame1			= 2400,
				DelayFrame2			= 1600,
				DelayFrame3			= 1600,
			},

			-- 미스톤 소환
			{
				AICheckFrame		= 1000,
				AICheckFrame1       = 500,
				AICheckFrame2       = 250,
				AICheckFrame3       = 250,
				AIFunc				= "Periot_Check_Attack02",
				DelayFrame			= 2200,
				DelayFrame1			= 1100,
				DelayFrame2			= 550,
				DelayFrame3			= 550,
			},

			-- 바닥찍기
			{
				AICheckFrame		= 270,
				AICheckFrame1       = 180,
				AICheckFrame2       = 90,
				AICheckFrame3       = 90,
				AIFunc				= "Periot_Check_Attack03",
				DelayFrame			= 270,
			},

			-- 생명의 섬광 전체
			{
				AICheckFrame		= 300,
				AIFunc				= "Periot_Check_Attack04",
				DelayFrame			= 1440,
				DelayFrame1			= 960,
				DelayFrame2			= 480,
				DelayFrame3			= 480,
			},

			-- 생명의 섬광 상단 체크
			{
				AICheckFrame		= 9999,
				AICheckFrame1       = 360,
				AICheckFrame2       = 270,
				AICheckFrame3       = 270,
				AIFunc				= "Periot_Check_Attack04_2",
				DelayFrame			= 1440,
				DelayFrame1			= 960,
				DelayFrame2			= 480,
				DelayFrame3			= 480,
			},

			-- 파괴의 섬광
			{
				AICheckFrame		= 100,
				AIFunc				= "Periot_Check_Attack05",
				DelayFrame			= 500,
			},

			-- 파괴의 섬광 상단 체크
			{
				AICheckFrame		= 220,
				AICheckFrame1       = 165,
				AICheckFrame2       = 55,
				AICheckFrame3       = 55,
				AIFunc				= "Periot_Check_Attack05_2",
				DelayFrame			= 495,
				DelayFrame1			= 330,
				DelayFrame2			= 165,
				DelayFrame3			= 165,
			},

			-- 근접공격
			{
				AICheckFrame		= 240,
				AICheckFrame1       = 120,
				AICheckFrame2       = 30,
				AICheckFrame3       = 30,
				AIFunc				= "Periot_Check_Attack06",
				DelayFrame			= 360,
				DelayFrame1			= 240,
				DelayFrame2			= 120,
				DelayFrame3			= 120,
			},

			-- 대쉬 공격
			{
				AICheckFrame		= 170,
				AICheckFrame1       = 120,
				AICheckFrame2       = 70,
				AICheckFrame3       = 70,
				AIFunc				= "Periot_Check_Attack07",
				DelayFrame			= 222,
			},

		},
	},
	
	--  달리기
	{
		ID	= "RUN",
		Motion  = "Periot_Move.frm",
		Func	= "Periot_RunFunc",

		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 35,
				AIFunc				= "Periot_Check_TurnToTarget",
				DelayFrame			= 35,
			},
			-- 대쉬 공격
			{
				AICheckFrame		= 120,
				AICheckFrame1       = 80,
				AICheckFrame2       = 40,
				AICheckFrame3       = 40,
				AIFunc				= "Periot_Check_Attack07",
				DelayFrame			= 150,
			},
			-- 멈추기
			{
				AICheckFrame		= 10,
				AIFunc				= "Periot_Check_RunStop",
				DelayFrame			= 40,
			},
		}
	},
	
	-- 죽기02
	{
		ID	= "DIE_LANDING",
		Motion  = "Periot_Die.frm",
		Func	= "Periot_DieFunc",
	},
	
	-- 잡아먹기
	{
		ID	= "ATTACK01",
		Motion  = "Periot_Attack01_Start.frm",
		Func	= "Periot_Attack01Func",
	},
	
	{
		ID	= "ATTACK01_SUCCESS",
		Motion  = "Periot_Attack01_Success.frm",
		Func	= "Periot_Attack01SuccessFunc",
	},
	
	{
		ID	= "ATTACK01_FAIL",
		Motion  = "Periot_Attack01_Fail.frm",
		Func	= "Periot_ToWaitFunc",
	},
	
	-- 미스톤 소환
	{
		ID	= "ATTACK02",
		Motion  = "Periot_Attack02.frm",
		Func	= "Periot_Attack02Func",
	},
	
	-- 바닥찍기
	{
		ID	= "ATTACK03",
		Motion  = "Periot_Attack03.frm",
		Func	= "Periot_Attack03Func",
	},
	
	-- 생명의 섬광
	{
		ID	= "ATTACK04",
		Motion  = "Periot_Attack04.frm",
		Func	= "Periot_Attack04Func",
	},
	
	-- 파괴의 섬광
	{
		ID	= "ATTACK05",
		Motion  = "Periot_Attack07.frm",
		Func	= "Periot_Attack05Func",
	},
	
	-- 근접공격
	{
		ID	= "ATTACK06",
		Motion  = "Periot_Attack05.frm",
		Func	= "Periot_Attack06Func",
	},
	
	-- 대쉬 공격
	{
		ID	= "ATTACK07",
		Motion  = "Periot_Attack06.frm",
		Func	= "Periot_Attack07Func",
	},
	
	-- 주문
	{
		ID	= "ATTACK08_DARK",
		Motion  = "Periot_Attack08.frm",
		Func	= "Periot_Attack08_DarkFunc",
	},
	
	-- 주문
	{
		ID	= "ATTACK08_LIFE",
		Motion  = "Periot_Attack08.frm",
		Func	= "Periot_Attack08_LifeFunc",
	},
}

CallBack =
{
	Land	= "OnPeriot_Land",
	Die	= "OnPeriot_Die",
	Damage  = "OnPeriot_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitPeriot( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:RegisterSummonMonsterType( MON_MYSTONE )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Periot_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 8
	if( iFrame == 1 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if(pMonster:IsSuperArmor() == true) then
			pMonster:SetSuperArmor( false )
		end
		
		pMonster:SetState( "WAIT" )   
		
	end
end

-- 달리기 상태
function Periot_RunFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	if( iFrame == 6 or iFrame == 48 ) then
	    pMonster:CameraVib( 1, 1.0, 0.1 )    
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "RUN" )
	end
end

-- 죽는상태
function Periot_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998022)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
	end
end

-- 데미지 입은거
function Periot_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	--pMonster:PlaySound(1036)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_ToWaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998049)
	elseif( iFrame == 63 ) then
		pMonster:AddDamage(DT_PERIOT_EAT_MONSTER)
		local posx = 0.2
		if( pMonster:GetIsRight() == false )then
			posx = -0.2
		end
		pMonster:AddTraceParticleToBone( "Mistone_Drain_01", 1.0, 15, 0, 0, posx, -0.1 )
		pMonster:AddTraceParticleToBone( "Mistone_Drain_02", 1.0, 15, 0, 0, posx, -0.1 )
		pMonster:AddTraceParticleToBone( "Mistone_Drain_03", 1.0, 15, 0, 0, posx, -0.1 )
		pMonster:AddTraceParticleToBone( "Mistone_Drain_04", 1.0, 15, 0, 0, posx, -0.1 )
		pMonster:AddTraceParticleToBone( "Mistone_Drain_05", 1.0, 15, 0, 0, posx, -0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() > 0 ) then
			pMonster:SetState( "ATTACK01_SUCCESS" )
		else
			pMonster:SetState( "ATTACK01_FAIL" )
		end
	end
end

function Periot_Attack01SuccessFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 51 ) then
		local posy = 0.65
		pMonster:AddParticle("Mistone_Spark_01", 0.0, posy)
		pMonster:AddParticle("Mistone_Spark_02", 0.0, posy)
		pMonster:AddParticle("Mistone_Spark_03", 0.0, posy)
		pMonster:AddParticle("Mistone_Spark_04", 0.0, posy)
		pMonster:AddParticle("Pariot_Eat_Spark_01", 0.0, posy)
		pMonster:PlaySound(998019)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
	if( iFrame == 2 ) then
		pMonster:AddParticle("Periot_Magiccircle_01", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_02", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_03", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_04", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_05", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_06", 0.0, 0.0)
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(998021)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("PERIOT_SUMMON")
        pMon.iMonType = MON_MYSTONE
        pMon.fX = -700
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
        
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("PERIOT_SUMMON")
        pMon.iMonType = MON_MYSTONE
        pMon.fX = 700
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
        
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("PERIOT_SUMMON")
        pMon.iMonType = MON_MYSTONE
        pMon.fX = -700
        pMon.fY = 300
        pMonster:SummonMonster( pMon )
        
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("PERIOT_SUMMON")
        pMon.iMonType = MON_MYSTONE
        pMon.fX = 700
        pMon.fY = 300
        pMonster:SummonMonster( pMon )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 55 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage(DT_PERIOT_EARTHQUAKE)
		else
			pMonster:AddDamage(DT_PERIOT_EARTHQUAKE_R)
		end
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(998023)
	elseif( iFrame == 66 ) then
		pMonster:CameraVib( 1, 0.6, 0.008 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		if( iFrame == 1 ) then
			pMonster:PlaySound(998044)
		end
	elseif( iFrame == 20 ) then
		pMonster:AddParticle("Pariot_Lifecircle_Start_01", 0.0, 1.4)
		pMonster:AddParticle("Pariot_Lifecircle_Start_02", 0.0, 1.4)
		pMonster:AddParticle("Pariot_Lifecircle_Start_03", 0.0, 1.4)
		pMonster:AddParticle("Pariot_Lifecircle_Start_01", 0.65, 1.15)
		pMonster:AddParticle("Pariot_Lifecircle_Start_02", 0.65, 1.15)
		pMonster:AddParticle("Pariot_Lifecircle_Start_03", 0.65, 1.15)
		pMonster:AddParticle("Pariot_Lifecircle_Start_01", 0.45, 0.85)
		pMonster:AddParticle("Pariot_Lifecircle_Start_02", 0.45, 0.85)
		pMonster:AddParticle("Pariot_Lifecircle_Start_03", 0.45, 0.85)
		pMonster:AddParticle("Pariot_Lifecircle_Start_01", -0.65, 1.15)
		pMonster:AddParticle("Pariot_Lifecircle_Start_02", -0.65, 1.15)
		pMonster:AddParticle("Pariot_Lifecircle_Start_03", -0.65, 1.15)
		pMonster:AddParticle("Pariot_Lifecircle_Start_01", -0.45, 0.85)
		pMonster:AddParticle("Pariot_Lifecircle_Start_02", -0.45, 0.85)
		pMonster:AddParticle("Pariot_Lifecircle_Start_03", -0.45, 0.85)
	elseif( iFrame == 91 ) then
		pMonster:PlaySound(998024)
		pMonster:AddDamageWithLocate(DT_PERIOT_HOMMING_MISSILE_HP, 0.0, 0.75)
		pMonster:AddDamageWithLocate(DT_PERIOT_HOMMING_MISSILE_HP, 0.7, 0.5)
		pMonster:AddDamageWithLocate(DT_PERIOT_HOMMING_MISSILE_HP, -0.7, 0.5)
		pMonster:AddDamageWithLocate(DT_PERIOT_HOMMING_MISSILE_HP, -0.5, 0.15)
		pMonster:AddDamageWithLocate(DT_PERIOT_HOMMING_MISSILE_HP, 0.5, 0.15)
	elseif( iFrame == 93 ) then
		pMonster:PlaySound(998045)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_Attack05Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		pMonster:PlaySound(998043)
	elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocate(DT_PERIOT_FIRE_DESTROY_ORB, 0.0, 0.55)
	elseif( iFrame >= 36 and iFrame < 180 ) then
		local posx = 0.55
		local posy = 0.6
		if( math.mod(iFrame, 18) == 0 ) then
			pMonster:AddParticle("Pariot_Destroycircle_Shoot_01", posx, posy)
			pMonster:AddParticle("Pariot_Destroycircle_Shoot_02", posx, posy)
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Periot_Attack06Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 38 ) then
		pMonster:PlaySound(998028)
		pMonster:AddDamage(DT_PERIOT_ATK1)
		local posx = 0.2
		local posy = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Pariot_Attack_First_01", posx, posy )
			pMonster:AddParticle( "Pariot_Attack_First_02", posx, posy )
			pMonster:AddParticle( "Pariot_Attack_First_03", posx, posy )
		else
			pMonster:AddParticleNoDirection( "Pariot_Attack_First_01_U", -posx, posy )
			pMonster:AddParticleNoDirection( "Pariot_Attack_First_02_U", -posx, posy )
			pMonster:AddParticleNoDirection( "Pariot_Attack_First_03_U", -posx, posy )
		end
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(998028)
		local posy = 0.8
		local posx = 0.3
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Pariot_Attack_Second_01", posx, posy )
			pMonster:AddParticle( "Pariot_Attack_Second_02", posx, posy )
			pMonster:AddParticle( "Pariot_Attack_Second_03", posx, posy )
		else
			posx = posx * -1
			pMonster:AddParticleNoDirection( "Pariot_Attack_Second_01_U", posx, posy )
			pMonster:AddParticleNoDirection( "Pariot_Attack_Second_02_U", posx, posy )
			pMonster:AddParticleNoDirection( "Pariot_Attack_Second_03_U", posx, posy )
		end
		pMonster:AddDamage(DT_PERIOT_ATK2)
	elseif( iFrame == 64 ) then
		pMonster:EndAttack()
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

local fGapX
function Periot_Attack07Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		if ( iFrame == 1 ) then
			fGapX = (pMonster:GetTargetX() - pMonster:GetX()) / 30
		end
	elseif( iFrame >= 40 and iFrame <= 70 ) then
		pMonster:SetSpeedX(fGapX * 1.1)
		print(fGapX)
		if( iFrame == 40 ) then
			pMonster:PlaySound(998050)
			if( pMonster:GetIsRight() ) then
				pMonster:AddTraceParticleNoDirection( "Pariot_Scratch" )
			else
				pMonster:AddTraceParticleNoDirection( "Pariot_Scratch_U" )
			end
		elseif( iFrame == 55 ) then
			pMonster:AddDamage(DT_PERIOT_DASH_ATK)
		elseif( iFrame == 65 ) then
			pMonster:PlaySound(998051)
		end
	elseif( iFrame == 71 ) then
		local posy = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Pariot_Attack_First_01", 0.20, posy )
			pMonster:AddParticle( "Pariot_Attack_First_02", 0.20, posy )
			pMonster:AddParticle( "Pariot_Attack_First_03", 0.20, posy )
		else
			pMonster:AddParticleNoDirection( "Pariot_Attack_First_01_U", -0.2, posy )
			pMonster:AddParticleNoDirection( "Pariot_Attack_First_02_U", -0.2, posy )
			pMonster:AddParticleNoDirection( "Pariot_Attack_First_03_U", -0.2, posy )
		end
		pMonster:SetSpeedX(fGapX/10)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end


function Periot_Attack08_DarkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		pMonster:PlaySound(998027)		
	elseif( iFrame == 35 ) then
		pMonster:AddDamage(DT_PERIOT_DESTROY_CASTING)
	elseif( iFrame == 110 ) then
		local posx = 0.55
		local posy = 1.19
		pMonster:AddParticle( "Pariot_Destroycircle_Spark_01", posx, posy )
		pMonster:AddParticle( "Pariot_Destroycircle_Spark_02", posx, posy )
		pMonster:AddParticle( "Pariot_Destroycircle_Spark_03", posx, posy )
		pMonster:AddParticle( "Pariot_Destroycircle_Spark_04", posx, posy )
		pMonster:AddTraceParticleToBone( "Periot_Destroycircle_Casting_Hand_01", 1.0, 15, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Periot_Destroycircle_Casting_Hand_02", 1.0, 15, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Periot_Destroycircle_Casting_Hand_01", 1.0, 28, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Periot_Destroycircle_Casting_Hand_02", 1.0, 28, 0, 0, 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK05" )
	end
end

function Periot_Attack08_LifeFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		pMonster:PlaySound(998027)
	elseif( iFrame == 35 ) then
		local posX = -0.55
		if( pMonster:GetIsRight() ) then
			posX = 0.55
		end
		local posY = 1.19
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_Circle_01", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_Circle_02", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_Circle_03", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateE", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateE1", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateE2", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateL", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateL1", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateL2", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateO", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateO1", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateO2", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateU", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateU1", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateU2", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateV", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateV1", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RotateV2", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RuneE", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RuneL", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RuneO", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RuneU", posX, posY)
		pMonster:AddParticleNoDirection("Periot_Lifecircle_Casting_RuneV", posX, posY)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK04" )
	end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Periot_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2200, 800, 2200, -100 ) == true ) then
		pMonster:ResetDelay()
	end
end

function Periot_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Periot_Check_Run( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end
end

function Periot_Check_RunStop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 450, -350, 600, 350, -800 ) == false ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
	end
end

function Periot_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSummonedMonsterCount() > 0 and pMonster:GetHP() / pMonster:GetMaxHP() < 0.7 ) then
			pMonster:SetState( "ATTACK01" )
			pMonster:ResetDelay()
	end
end

function Periot_Check_Attack01_2( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSummonedMonsterCount() > 0 ) then
		if((pMonster:GetHP() / pMonster:GetMaxHP() > 0.07) and (pMonster:GetHP() / pMonster:GetMaxHP() < 0.3)) then
			pMonster:SetState( "ATTACK01" )
			pMonster:ResetDelay()
		end
	end
end

function Periot_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Periot_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 280, -280, 80, 280, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Periot_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 350, -350, 460, 350, -100 ) == true ) then
		pMonster:SetState( "ATTACK08_LIFE" )
		pMonster:ResetDelay()
	end
end

function Periot_Check_Attack04_2( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 1200, -1200, 700, 1200, 360 ) == true ) then
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK08_LIFE" )
			pMonster:ResetDelay()
		end
	end
end

function Periot_Check_Attack05( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 320, -320, 460, 320, -100 ) == true ) then
		pMonster:SetState( "ATTACK08_DARK" )
		pMonster:ResetDelay()
	end
end

function Periot_Check_Attack05_2( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 1200, -1200, 700, 1200, 360 ) == true ) then
		pMonster:SetState( "ATTACK08_DARK" )
		pMonster:ResetDelay()
	end
end

function Periot_Check_Attack06( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 180, -180, 440, 180, -100 ) == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
	end
end

function Periot_Check_Attack07( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 1500, -800, 500, 800, -100 ) == true ) then
		pMonster:SetState( "ATTACK07" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnPeriot_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
end

function OnPeriot_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE_LANDING" )
end

function OnPeriot_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	
	
	if ( pMonster:FloatRand() < 0.15 and pMonster:CheckState("WAIT") ) then	
	
		local fRand = pMonster:FloatRand()
		local hpRate = pMonster:GetHP() / pMonster:GetMaxHP()
		
		if ( hpRate > 0.5 ) then
			if( pMonster:CheckTargetInRange( 1500, -800, 500, 800, -100 ) == true ) then
				pMonster:SetState( "ATTACK07" )
			elseif( pMonster:CheckTargetInRange( 180, -180, 440, 180, -100 ) == true ) then
				pMonster:SetState( "ATTACK06" )
			end
		else
			if ( fRand < 0.6 ) then
				if( pMonster:CheckTargetInRange( 1500, -800, 500, 800, -100 ) == true ) then
					pMonster:SetState( "ATTACK07" )
				elseif( pMonster:CheckTargetInRange( 180, -180, 440, 180, -100 ) == true ) then
					pMonster:SetState( "ATTACK06" )
				end
			elseif( fRand < 0.8 ) then
				pMonster:SetState( "ATTACK04" )
			else
				pMonster:SetState( "ATTACK05" )
			end
		end
		
		pMonster:TurnToTarget()
	end
end
