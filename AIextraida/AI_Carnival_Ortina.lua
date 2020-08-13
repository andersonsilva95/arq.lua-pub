-- AI_Carnival_Ortina.lua

ActionList =
{
	-- 대기
	{
		ID	  = "WAIT",
		Motion  = "ortina_Wait_A.frm",
		Func	= "Carnival_Ortina_WaitFunc",

		Trigger =
		{
			-- 타게팅
            {
                AICheckFrame        = 100,
                AIFunc              = "Carnival_Ortina_Check_Targeting",
                DelayFrame          = 100,
            },

			-- 대기중 표효
			{
				AICheckFrame		= 75,
				AIFunc				= "Carnival_Ortina_Check_WaitB",
				DelayFrame			= 550,
			},
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 25,
				AIFunc				= "Carnival_Ortina_Check_TurnToTarget",
				DelayFrame			= 75,
			},

			-- 걷기 [80%]
			{
				AICheckFrame		= 110,
				AIFunc				= "Carnival_Ortina_Check_Walk",
				DelayFrame			= 220,
			},

			-- 하이점프
			{
				AICheckFrame		= 102,
				AIFunc				= "Carnival_Ortina_Check_JumpUp",
				DelayFrame			= 20,
			},
			-- 점프다운
			{
				AICheckFrame		= 101,
				AIFunc				= "Carnival_Ortina_Check_JumpDown",
				DelayFrame			= 20,
			},

			-- 근접공격
			{
				AICheckFrame		= 120,
				AIFunc				= "Carnival_Ortina_Check_Attack01",
				DelayFrame			= 240,
			},

			-- 어스퀘이크 [50%]
			{
				AICheckFrame		= 250,
				AIFunc				= "Carnival_Ortina_Check_Attack02",
				DelayFrame			= 500,
			},

			-- 세이버투스 소환 [6]
			{
				AICheckFrame		= 500,
				AIFunc				= "Carnival_Ortina_Check_Attack03",
				DelayFrame			= 900,
			},

			-- 채찍 공격
			{
				AICheckFrame		= 55,
				AIFunc				= "Carnival_Ortina_Check_Attack04",
				DelayFrame			= 110,
			},
		},
	},

	-- 이동
	{
		ID	  = "WALK",
		Motion  = "ortina_Walk.frm",
		Func	= "Carnival_Ortina_WalkFunc",
		EnableMoveCheck = 1,
		MoveFailFunc	= "Carnival_Ortina_MoveFail",

		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 75,
				AIFunc				= "Carnival_Ortina_Check_TurnToTarget",
				DelayFrame			= 75,
			},

			-- 하이점프
			{
				AICheckFrame		= 52,
				AIFunc				= "Carnival_Ortina_Check_JumpUp",
				DelayFrame			= 20,
			},
			-- 점프다운
			{
				AICheckFrame		= 51,
				AIFunc				= "Carnival_Ortina_Check_JumpDown",
				DelayFrame			= 20,
			},
			-- 채찍 공격
			{
				AICheckFrame		= 44,
				AIFunc				= "Carnival_Ortina_Check_Attack04",
				DelayFrame			= 110,
			},
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_Ortina_Check_Stop",
                DelayFrame          = 55,
            },
		},
	},

	-- 포효
	{
		ID	  = "UWA",
		Motion  = "ortina_Wait_B.frm",
		Func	= "Carnival_Ortina_WaitBFunc",
	},
	
	-- turn
	{
		ID	  = "TURN",
		Motion  = "ortina_Turn.frm",
		Func	= "Carnival_Ortina_TurnFunc",
	},
	
	-- 점프
	{
		ID	  = "JUMP",
		Motion  = "ortina_Jump_up.frm",
		Func	= "Carnival_SOrtina_JumpFuncUp",
	},

	-- 점프다운
	{
		ID	  = "JUMPDOWN",
		Motion  = "ortina_Jump_down.frm",
		Func	= "Carnival_Ortina_JumpFunc",
	},

	-- 착지
	{
		ID	  = "LANDING",
		Motion  = "ortina_Jump_landing.frm",
		Func	= "Carnival_Ortina_JumpFunc",
	},

	-- 공격01 멧돼지 돌진
	{
		ID	  = "ATTACK01_START",
		Motion  = "ortina_Attack01_start.frm",
		Func	= "Carnival_Ortina_Attack01Func",
	},
	
	-- 공격01 멧돼지 돌진
	{
		ID	  = "ATTACK01_ATK",
		Motion  = "ortina_Attack01_attack.frm",
		Func	= "Carnival_Ortina_Attack01AtkFunc",
	},
	
	-- 공격01 멧돼지 돌진
	{
		ID	  = "ATTACK01_END",
		Motion  = "ortina_Attack01_end.frm",
		Func	= "Carnival_Ortina_Attack01EndFunc",
	},

	-- 공격02 멧돼지 연속 점프
	{
		ID	  = "ATTACK02",
		Motion  = "ortina_Attack02_start.frm",
		Func	= "Carnival_Ortina_Attack02Func",
	},
	
	-- 공격02 멧돼지 연속 점프
	{
		ID	  = "ATTACK02_ATK",
		Motion  = "ortina_Attack02_attack.frm",
		Func	= "Carnival_Ortina_Attack02AtkFunc",
	},
	
	-- 공격02 멧돼지 연속 점프
	{
		ID	  = "ATTACK02_END",
		Motion  = "ortina_Attack02_end.frm",
		Func	= "Carnival_Ortina_Attack02EndFunc",
	},
	
	-- 공격03 라이오네스 소환
	{
		ID	  = "ATTACK03",
		Motion  = "ortina_Attack03.frm",
		Func	= "Carnival_Ortina_Attack03Func",
	},
	
	-- 공격04 채찍 2번 휘두르기 
	{
		ID	  = "ATTACK04",
		Motion  = "ortina_Attack04.frm",
		Func	= "Carnival_Ortina_Attack04Func",
	},
	
	-- 데미지 중
	{
		ID	= "DAMAGE_MIDDLE",
		Motion  = "ortina_Damage_middle.frm",
		Func	= "Carnival_Ortina_DamageFunc",
	},
	
	-- 데미지 하
	{
		ID	= "DAMAGE_DOWN",
		Motion  = "ortina_Damage_down.frm",
		Func	= "Carnival_Ortina_DamageFunc",
	},
	
	-- 죽기
	{
		ID	  = "DIE",
		Motion  = "ortina_Die.frm",
		Func	= "Carnival_Ortina_DieFunc",
	},
}

CallBack =
{
	Land	= "OnCarnival_Ortina_Land",
	Die	 = "OnCarnival_Ortina_Die",
	Damage  = "OnCarnival_Ortina_Damage",
	--DefenceArrow = "",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitCarnival_Ortina( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:RegisterSummonMonsterType( MON_CARNIVAL_LYONNESSE )
	pMonster:SetCountValue(0)
	
	local MaxHP = pMonster:GetHP()
	local AttackPoint = pMonster:GetAttackPoint()
	if( 31 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *5
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	elseif( 51 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *6
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	else
		MaxHP = MaxHP *35
		AttackPoint = AttackPoint *3.5
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	end
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Carnival_Ortina_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
	end
end

-- 대기 중 표효
function Carnival_Ortina_WaitBFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:PlaySound(999037)
	end
end

-- 걷기 상태
function Carnival_Ortina_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end

-- 점프 상태
function Carnival_Ortina_JumpFuncUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMPDOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- 점프 상태
function Carnival_Ortina_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end


-- 착지 상태
function Carnival_Ortina_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  근접공격 상태
function Carnival_Ortina_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 15 ) then
		pMonster:PlaySound(999038)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK01_ATK" )
	end
end

--  근접공격 상태
function Carnival_Ortina_Attack01AtkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 8 )
	elseif( iFrame == 2 ) then
		pMonster:StartAttack( 7, PAR_DOWN, 0.5, 8, 8, 19)
	elseif( iFrame == 17 ) then
		pMonster:PlaySound(999039)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 6.5 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndAttack()
		if( pMonster:GetCountValue() >= 3 ) then
			pMonster:SetState( "ATTACK01_END" )
			pMonster:SetCountValue(0)
		else
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK01_ATK" )
		end
	end
end

--  근접공격 상태
function Carnival_Ortina_Attack01EndFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  광란의 뛰어다니기!
function Carnival_Ortina_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:SetInvincible( true )
		pMonster:StartText("JUMP")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK02_ATK" )
		pMonster:PlaySound(999040)
	end
end

--  광란의 뛰어다니기!
function Carnival_Ortina_Attack02AtkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		pMonster:SetSuperArmor(true)
		pMonster:SetInvincible( true )
		pMonster:SetTarget( 100, -800, 600, 800, -600 )
		pMonster:SetNoCheckContact( 50 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )
        pMonster:SetSpeedY( 0.1 )
        pMonster:TurnToTarget()
	elseif( iFrame == 38 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame == 40 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", 0.10, -0.85 )
			pMonster:AddParticleNoDirection( "Guardiankung_Smash_02", 0.10, -0.75 )
			pMonster:AddParticleNoDirection( "Guardiankung_Smash_03", 0.10, -0.75 )
			pMonster:AddParticleNoDirection( "Guardiankung_Smash_04", 0.10, -0.65 )
		else
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", -0.10, -0.85 )
			pMonster:AddParticleNoDirection( "Guardiankung_Smash_02", -0.10, -0.75 )
			pMonster:AddParticleNoDirection( "Guardiankung_Smash_03", -0.10, -0.75 )
			pMonster:AddParticleNoDirection( "Guardiankung_Smash_04", -0.10, -0.65 )
		end
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() >= 2 ) then
			pMonster:SetState( "ATTACK02_END" )
			pMonster:SetCountValue(0)
			
		else
			print(pMonster:GetCountValue())
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK02_ATK" )
		end
	end
	
	if( iFrame > 20 ) then
		if( pMonster:GetSpeedY() < 0.1 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.01 )
		end
	end
end

--  광란의 뛰어다니기!
function Carnival_Ortina_Attack02EndFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  라이오네스 소환
function Carnival_Ortina_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local CheckSummonSlot=true;
	
	if( iFrame == 0 ) then
		CheckSummonSlot = pMonster:CheckSummonSlot()
		local pMon = KSummonInfo()
		pMon:Init()
		pMon:SetState("SUMMON")
		pMon.iMonType = MON_CARNIVAL_LYONNESSE
		pMon.fX = 350.0
		pMon.fY = 0
		pMonster:SummonMonster( pMon, true, false, pMonster.GetLevel() -1 )
		pMonster:PlaySound(983013)
	elseif( iFrame == 50 ) then
		local pMon = KSummonInfo()
		pMon:Init()
		pMon:SetState("SUMMON")
		pMon.iMonType = MON_CARNIVAL_LYONNESSE
		pMon.fX = 350.0
		pMon.fY = 0
		pMonster:SummonMonster( pMon, true, false, pMonster:GetLevel() -1 )
		pMonster:PlaySound(983013)
	end
	
	if( iFrame >= pMonster:GetLastFrame() or false == CheckSummonSlot ) then
		pMonster:SetState( "WAIT" )
	end
end

--  채찍질
function Carnival_Ortina_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 35 ) then
		pMonster:PlaySound(983028)
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(983014)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage( DT_MON_ORTINA_ATTACK04_1_R )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_01_R", 0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_02_R", 0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_03_R", 0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_04_R", 0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_05", 0.4, 0.18 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_06", 0.4, 0.18 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_07", 0.4, 0.18 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_08", 0.4, 0.18 )
		else
			pMonster:AddDamage( DT_MON_ORTINA_ATTACK04_1 )
			--pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_01", -0.4, 0.28 )
			--pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_02", -0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_03", -0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_04", -0.4, 0.28 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_05", -0.4, 0.18 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_06", -0.4, 0.18 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_07", -0.4, 0.18 )
			pMonster:AddParticleNoDirection( "Circus_Ortina_Whip_08", -0.4, 0.18 )
		end	
	elseif( iFrame == 65 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage( DT_MON_ORTINA_ATTACK04_2_R )
		else
			pMonster:AddDamage( DT_MON_ORTINA_ATTACK04_2 )
		end	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end   
end

-- 데미지 입은거
function Carnival_Ortina_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 죽는상태
function Carnival_Ortina_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999067)
		pMonster:PlaySound(995020)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()		
	end
end

function Carnival_Ortina_TurnFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetIsRight( not pMonster:GetIsRight() )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Carnival_Ortina_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -300, 460, 300, -400 ) == true ) then
		pMonster:TurnToTarget()
		
        pMonster:ResetDelay()
    end
end

function Carnival_Ortina_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -600, 500, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_WaitB( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "UWA" )
	pMonster:ResetDelay()
end

function Carnival_Ortina_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 700, 300, -700 ) == false and pMonster:FloatRand() < 0.8 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Carnival_Ortina_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 700, 300, -700 ) == true ) then
		pMonster:SetSpeedX( 0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 800, -500, 200, 500, -100 ) == true ) then
		pMonster:SetState( "ATTACK01_START" )
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSummonedMonsterCount() < 6 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end
function Carnival_Ortina_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 180, -180, 200, 180, -100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 200, -200, 600, 200, 200 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Carnival_Ortina_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Carnival_Ortina_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -600 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetSpeedY( 0.01 )			
		pMonster:SetState( "JUMPDOWN" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnCarnival_Ortina_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if ( pMonster:CheckState("ATTACK02_ATK") == false and pMonster:CheckState("ATTACK01_ATK") == false and pMonster:CheckState("ATTACK03") == false and pMonster:GetHP() > 0 ) then
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "WAIT" )
	end
end

function OnCarnival_Ortina_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end

function OnCarnival_Ortina_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then		
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK03" ) == false ) then	
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK01_START" )
		else
			pMonster:SetState( "ATTACK02" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function Carnival_Ortina_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.01) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(30)
			pMonster:SetState( "JUMPDOWN" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end

function Carnival_Ortina_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.8) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:SetIgnoreFHCheck(true)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end
