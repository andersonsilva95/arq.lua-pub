-- AI_SharkAron.lua

ActionList =
{
	-- 대기
	{
		ID	  = "WAIT",
		Motion  = "SharkAron_Wait_A.frm",
		Func	= "SharkAron_WaitFunc",

		Trigger =
		{
			-- 대기중 표효
			{
				AICheckFrame		= 75,
				AIFunc				= "SharkAron_Check_WaitB",
				DelayFrame			= 550,
			},
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 35,
				AIFunc				= "SharkAron_Check_TurnToTarget",
				DelayFrame			= 35,
			},
			-- 걷기
			{
				AICheckFrame		= 35,
				AIFunc				= "SharkAron_Check_Walk",
				DelayFrame			= 80,
			},
			-- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "SharkAron_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- 점프다운
			{
				AICheckFrame		= 80,
				AIFunc				= "SharkAron_Check_JumpDown",
				DelayFrame			= 85,
			},
			
			-- 근접공격
			{
				AICheckFrame		= 110,
				AIFunc				= "SharkAron_Check_Attack01",
				DelayFrame			= 150,
			},
			-- 카이저웨이브
			{
				AICheckFrame		= 330,
				AIFunc				= "SharkAron_Check_Attack02",
				DelayFrame			= 400,
			},
			-- 세번치기
			{
				AICheckFrame		= 165,
				AICheckFrame1       = 110,
				AICheckFrame2       = 55,
				AICheckFrame3       = 55,
				AIFunc				= "SharkAron_Check_Attack03",
				DelayFrame			= 90,
			},
			
			-- 얼음공주
			{
				AICheckFrame		= 200,
				AIFunc				= "SharkAron_Check_Attack04",
				DelayFrame			= 400,
			},
		},
	},

	-- 이동
	{
		ID	  = "WALK",
		Motion  = "SharkAron_Walk.frm",
		Func	= "SharkAron_WalkFunc",
		EnableMoveCheck = 1,
		MoveFailFunc	= "SharkAron_MoveFail",

		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 75,
				AIFunc				= "SharkAron_Check_TurnToTarget",
				DelayFrame			= 75,
			},

			-- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "SharkAron_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- 점프다운
			{
				AICheckFrame		= 110,
				AIFunc				= "SharkAron_Check_JumpDown",
				DelayFrame			= 110,
			},
			-- 세번치기
			{
				AICheckFrame		= 75,
				AIFunc				= "SharkAron_Check_Attack03",
				DelayFrame			= 110,
			},
			-- 근접공격
			{
				AICheckFrame		= 110,
				AIFunc				= "SharkAron_Check_Attack01",
				DelayFrame			= 220,
			},
			-- 몸통박치기
			{
				AICheckFrame		= 250,
				AIFunc				= "SharkAron_Check_Attack02",
				DelayFrame			= 400,
			},
		},
	},

	-- 포효
	{
		ID	  = "UWA",
		Motion  = "SharkAron_Wait_B.frm",
		Func	= "SharkAron_WaitBFunc",
	},
	
	-- turn
	{
		ID	  = "TURN",
		Motion  = "SharkAron_Turn.frm",
		Func	= "SharkAron_TurnFunc",
	},
	
	-- 점프
	{
		ID	  = "JUMP",
		Motion  = "SharkAron_Jump.frm",
		Func	= "SharkAron_JumpFuncUp",
	},

	-- 점프다운
	{
		ID	  = "JUMPDOWN",
		Motion  = "SharkAron_Jump_Down.frm",
		Func	= "SharkAron_JumpFunc",
	},

	-- 착지
	{
		ID	  = "LANDING",
		Motion  = "SharkAron_Jump_Landing.frm",
		Func	= "SharkAron_JumpFunc",
	},

	-- 공격01 멧돼지 돌진
	{
		ID	  = "ATTACK01_START",
		Motion  = "SharkAron_Attack01_Start.frm",
		Func	= "SharkAron_Attack01Func",
	},
	
	-- 공격01 멧돼지 돌진
	{
		ID	  = "ATTACK01_ATK",
		Motion  = "SharkAron_Attack01_Attack.frm",
		Func	= "SharkAron_Attack01AtkFunc",
	},
	
	-- 공격01 멧돼지 돌진
	{
		ID	  = "ATTACK01_END",
		Motion  = "SharkAron_Attack01_End.frm",
		Func	= "SharkAron_Attack01EndFunc",
	},

	-- 공격02 멧돼지 연속 점프
	{
		ID	  = "ATTACK02",
		Motion  = "SharkAron_Attack02_Start.frm",
		Func	= "SharkAron_Attack02Func",
	},
	
	-- 공격02 멧돼지 연속 점프
	{
		ID	  = "ATTACK02_ATK",
		Motion  = "SharkAron_Attack02_Attack.frm",
		Func	= "SharkAron_Attack02AtkFunc",
	},
	
	-- 공격02 멧돼지 연속 점프
	{
		ID	  = "ATTACK02_END",
		Motion  = "SharkAron_Attack02_End.frm",
		Func	= "SharkAron_Attack02EndFunc",
	},
	
	-- 공격03 창 3번 휘두르기 
	{
		ID	  = "ATTACK03",
		Motion  = "SharkAron_Attack03.frm",
		Func	= "SharkAron_Attack03Func",
	},
	
	-- 공격04 얼음 공주 나가신다~
	{
		ID	  = "ATTACK04",
		Motion  = "SharkAron_Attack04.frm",
		Func	= "SharkAron_Attack04Func",
	},
	
	-- 데미지 중
	{
		ID	= "DAMAGE_MIDDLE",
		Motion  = "SharkAron_Damage_Middle.frm",
		Func	= "SharkAron_DamageFunc",
	},
	
	-- 데미지 하
	{
		ID	= "DAMAGE_DOWN",
		Motion  = "SharkAron_Damage_Down.frm",
		Func	= "SharkAron_DamageFunc",
	},
	
	-- 죽기
	{
		ID	  = "DIE",
		Motion  = "SharkAron_Die.frm",
		Func	= "SharkAron_DieFunc",
	},
}

CallBack =
{
	Land	= "OnSharkAron_Land",
	Die	 = "OnSharkAron_Die",
	Damage  = "OnSharkAron_Damage",
	--DefenceArrow = "",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitSharkAron( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function SharkAron_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:FloatRand() < 0.1 ) then
	--	pMonster:PlaySound(999037)
	--end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
	end
end

-- 대기 중 표효
function SharkAron_WaitBFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:PlaySound(999037)
	end
end

-- 걷기 상태
function SharkAron_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end

-- 점프 상태
function SharkAron_JumpFuncUp( iMonsterIndex, iFrame )
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
function SharkAron_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end


-- 착지 상태
function SharkAron_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  근접공격 상태
function SharkAron_Attack01Func( iMonsterIndex, iFrame )
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
function SharkAron_Attack01AtkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 8 )
	elseif( iFrame == 2 ) then
		pMonster:StartAttack( 7, PAR_DOWN, 0.5, 8, 8, 19)
	elseif( iFrame == 17 ) then
		pMonster:PlaySound(999039)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 8 )
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
function SharkAron_Attack01EndFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  광란의 뛰어다니기!
function SharkAron_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:StartText("JUMP")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK02_ATK" )
		pMonster:PlaySound(999040)
	end
end

--  광란의 뛰어다니기!
function SharkAron_Attack02AtkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
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
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", 0.10, -1.0 )
		else
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", -0.10, -1.0 )
		end
	end
	
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() >= 3 ) then
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
function SharkAron_Attack02EndFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  창 세번 휘두르기!
function SharkAron_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(999041)
		pMonster:SetDrawSlash( 0 , true )
		pMonster:StartAttack( 3, PAR_BIG_DAMAGE, 0.2, 36, 37, 6)
	elseif( iFrame == 79 ) then
		pMonster:PlaySound(999041)
		pMonster:SetDrawSlash( 0 , true )
		pMonster:StartAttack( 3, PAR_BIG_DAMAGE, 0.2, 36, 37, 4)
	elseif( iFrame == 106 ) then
		pMonster:PlaySound(999041)
		pMonster:SetDrawSlash( 0 , true )
		pMonster:StartAttack( 5, PAR_FRONTDOWN_DROPDAMAGE_3, 0.2, 36, 37, 5)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetDrawSlash( 0 , false )
	end
end

--  얼음 공주 나가신다!
function SharkAron_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 17 ) then
		pMonster:PlaySound(999042)
	elseif( iFrame == 20 ) then 
		pMonster:PlaySound(999044)
	elseif( iFrame == 65 ) then 
		pMonster:AddDamageWithLocate(DT_ARME4_SPECIAL2,0,0)
		pMonster:AddDamageWithLocate(DT_ARME4_SPECIAL2_PARTICLE1,0,0)
		pMonster:AddDamageWithLocate(DT_ARME4_SPECIAL2_PARTICLE2,0,0)
	elseif( iFrame == 71 ) then
		pMonster:PlaySound(999043)
		pMonster:AddDamageWithLocate(DT_SHARKARON_ICESPEAR1, 0.0, 0.0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 데미지 입은거
function SharkAron_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 죽는상태
function SharkAron_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999067)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()		
	end
end

function SharkAron_TurnFunc( iMonsterIndex, iFrame )
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

function SharkAron_Check_WaitB( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "UWA" )
	pMonster:ResetDelay()
end

function SharkAron_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:SetState("TURN")
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end


function SharkAron_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 800, -700, 250, 700, -150 ) == true ) then
		pMonster:SetState( "ATTACK01_START" )
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 0, -600, 500, 600, -300 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -300, 450, 300, -200 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end
function SharkAron_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 500, -500, 250, 500, -150 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		SharkAron_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 30, -400, -40, 400, -1000 ) == true ) then
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
function OnSharkAron_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if ( pMonster:CheckState("ATTACK02_ATK") == false and pMonster:CheckState("ATTACK01_ATK") == false and pMonster:CheckState("ATTACK03") == false and pMonster:GetHP() > 0 ) then
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "WAIT" )
	end
end

function OnSharkAron_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end

function OnSharkAron_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then		
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.7 ) then
			pMonster:SetState( "ATTACK03" )
		else
			pMonster:SetState( "ATTACK04" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function SharkAron_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
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

function SharkAron_Jump( iMonsterIndex )
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
