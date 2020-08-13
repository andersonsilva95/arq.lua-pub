-- AI_Bultaros.lua

ActionList =
{
	-- 대기
	{
		ID	  = "WAIT",
		Motion  = "Bultaros_Wait.frm",
		Func	= "Bultaros_WaitFunc",

		Trigger =
		{
			-- 딥임팩트 요청
			{
				AICheckFrame		= 10,
				AIFunc				= "Bultaros_Check_Astarot_Meteor",
				DelayFrame			= 550,
			},
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 75,
				AIFunc				= "Bultaros_Check_TurnToTarget",
				DelayFrame			= 75,
			},
			-- 걷기
			{
				AICheckFrame		= 35,
				AIFunc				= "Bultaros_Check_Walk",
				DelayFrame			= 110,
			},
			-- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "Bultaros_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- 점프다운
			{
				AICheckFrame		= 110,
				AIFunc				= "Bultaros_Check_JumpDown",
				DelayFrame			= 110,
			},
			-- 근접공격
			{
				AICheckFrame		= 55,
				AIFunc				= "Bultaros_Check_Attack01",
				DelayFrame			= 110,
			},
			-- 카이저웨이브
			{
				AICheckFrame		= 75,
				AIFunc				= "Bultaros_Check_Attack02",
				DelayFrame			= 165,
			},
			-- 버서커드라이브
			{
				AICheckFrame		= 330,
				AIFunc				= "Bultaros_Check_Attack03",
				DelayFrame			= 550,
			},			
		},
	},

	-- 이동
	{
		ID	  = "WALK",
		Motion  = "Bultaros_Walk.frm",
		Func	= "Bultaros_WalkFunc",
		EnableMoveCheck = 1,
		MoveFailFunc	= "Bultaros_MoveFail",

		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 75,
				AIFunc				= "Bultaros_Check_TurnToTarget",
				DelayFrame			= 75,
			},	
			
			-- 근접공격
			{
				AICheckFrame		= 35,
				AIFunc				= "Bultaros_Check_Attack01",
				DelayFrame			= 110,
			},

			-- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "Bultaros_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- 점프다운
			{
				AICheckFrame		= 110,
				AIFunc				= "Bultaros_Check_JumpDown",
				DelayFrame			= 110,
			},

			-- 몸통박치기
			{
				AICheckFrame		= 75,
				AIFunc				= "Bultaros_Check_Attack02",
				DelayFrame			= 165,
			},
		},
	},

	-- 점프
	{
		ID	  = "JUMP",
		Motion  = "bultaros_jump.frm",
		Func	= "Bultaros_JumpFunc",
	},

	-- 점프다운
	{
		ID	  = "JUMPDOWN",
		Motion  = "bultaros_jumpdown.frm",
		Func	= "Bultaros_JumpFunc",
	},

	-- 착지
	{
		ID	  = "LANDING",
		Motion  = "bultaros_landing.frm",
		Func	= "Bultaros_JumpFunc",
	},

	-- 공격01
	{
		ID	  = "ATTACK01",
		Motion  = "bultaros_attack01.frm",
		Func	= "Bultaros_Attack01Func",
	},

	-- 공격02
	{
		ID	  = "ATTACK02",
		Motion  = "bultaros_attack02.frm",
		Func	= "Bultaros_Attack02Func",
	},

	-- 버서크드라이브 준비
	{
		ID	  = "ATTACK03READY",
		Motion  = "bultaros_attack03Ready.frm",
		Func	= "Bultaros_Attack03ReadyFunc",
	},
	
	-- 버서크드라이브 도약
	{
		ID	  = "ATTACK03UP",
		Motion  = "bultaros_attack03Up.frm",
		Func	= "Bultaros_Attack03UpFunc",
		Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Bultaros_Check_Attack03_Target",
                DelayFrame          = 0,
            },
        }
	},
	
	-- 버서크드라이브 강하
	{
		ID	  = "ATTACK03DOWN",
		Motion  = "bultaros_attack03Down.frm",
		Func	= "Bultaros_Attack03DownFunc",
	},
	
	-- 버서크드라이브 착지
	{
		ID	  = "ATTACK03LANDING",
		Motion  = "bultaros_attack03Landing.frm",
		Func	= "Bultaros_Attack03LandingFunc",
	},

	-- 딥임팩트 요청
	{
		ID	  = "ASTAROT_METEOR",
		Motion  = "Bultaros_Wait.frm",
		Func	= "Bultaros_Astarot_MeteorFunc",
	},
	
	-- 딥임팩트 요청02
	{
		ID	  = "ASTAROT_METEOR02",
		Motion  = "Bultaros_Wait.frm",
		Func	= "Bultaros_Astarot_Meteor02Func",
	},
	
	-- 죽기
	{
		ID	  = "DIE",
		Motion  = "Bultaros_Die.frm",
		Func	= "Bultaros_DieFunc",
	},

	-- 소환 대기
	{
		ID	= "RECALL_WAIT",
		Motion	= "bultaros_recall.frm",
		Func	= "Bultaros_RecallWaitFunc",

	},
	-- 소환
	{
		ID	= "RECALL",
		Motion	= "bultaros_recall.frm",
		Func	= "Bultaros_RecallFunc",
	},

}

CallBack =
{
	Land	= "OnBultaros_Land",
	Die	 = "OnBultaros_Die",
	Damage  = "OnBultaros_Damage",
	--DefenceArrow = "",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitBultaros( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "RECALL_WAIT" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 소환 대기
function Bultaros_RecallWaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetFrameLock( true )
	pMonster:ToggleRender( false )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "RECALL_WAIT" )		
	end
end

-- 소환
function Bultaros_RecallFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		pMonster:SetFrameLock( false )
		pMonster:ToggleRender( true )
		pMonster:PlaySound(571)
		pMonster:PlaySound(572)
		pMonster:PlaySound(573)		
		pMonster:PlaySound(575)
		pMonster:AddParticle( "Butaros_Recall01", 0.1, 0.3 )
		pMonster:AddParticle( "Butaros_Recall02", 0.1, 0.3 )
		pMonster:AddParticle( "Butaros_Recall03", 0.1, 0.3 )
		pMonster:AddParticle( "Butaros_Recall04", 0.1, 0.3 )
		pMonster:AddParticle( "Butaros_Recall05", 0.1, 0.3 )
		pMonster:AddParticle( "Butaros_Recall06", 0.1, 0.3 )
		pMonster:AddParticle( "Butaros_Recall07", 0.1, 0.3 )
	elseif( iFrame == 31 ) then
		pMonster:PlaySound(1040)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
	end
end

-- 대기 상태
function Bultaros_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
	end
end

-- 걷기 상태
function Bultaros_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end

-- 점프 상태
function Bultaros_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end


-- 착지 상태
function Bultaros_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  근접공격 상태
function Bultaros_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 16 ) then
		pMonster:PlaySound(1038)
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 2.0 )
	elseif( iFrame == 29 ) then
		pMonster:AddDamage( DT_BULTAROS01_01 )
	elseif( iFrame == 36 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 2.0 )		
	elseif( iFrame == 48 ) then
		pMonster:AddDamage( DT_BULTAROS01_01 )
	elseif( iFrame == 66 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 2.4 )
	elseif( iFrame == 71 ) then
		pMonster:AddDamage( DT_BULTAROS01_02 )
	elseif( iFrame == 86 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.0 )
	elseif( iFrame == 96 ) then
		pMonster:PlaySound(1038)
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 2.4 )
	elseif( iFrame == 121 ) then		
		pMonster:AddParticle( "Ryan04_special3-3_boom_01", 0.5, 0.0)		
		pMonster:EarthQuakeWithRange( 25, 0.044, 0.02, 0.75 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  카이저웨이브 상태
function Bultaros_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:StartText("BUSTER")				
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(1039)	
	elseif( iFrame == 66 ) then		
		pMonster:PlaySound(1040)
		pMonster:AddParticle( "Bultaros_Kaiserwave_Shot_01", 0.40, 0.4)
		pMonster:AddParticle( "Bultaros_Kaiserwave_Shot_02", 0.40, 0.4)
		pMonster:AddParticle( "Bultaros_Kaiserwave_Shot_03", 0.40, 0.4)
		if( pMonster:GetIsRight() == true ) then
			
			pMonster:AddDamage( DT_BULTAROS02 )
		else
			pMonster:AddDamage( DT_BULTAROS02_R )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  버서커드라이브 준비 상태
function Bultaros_Attack03ReadyFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03UP" )
	end
end

--  버서커드라이브 도약 상태
function Bultaros_Attack03UpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetSpeedY() >= 2.5 ) then
		pMonster:SetSpeedY( 0.0 )
	end
	
	if( iFrame == 1 ) then
		pMonster:AddParticle( "Bultaros_Berserkdrive_Jump_01", 0.0, 0.05 )				
		pMonster:SetSuperArmor( true ) 
        pMonster:SetSpeedY( 0.2 )
        pMonster:StartText("JUMP")				
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03DOWN" )
	end
end

--  버서커드라이브 강하 상태
function Bultaros_Attack03DownFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 ) then
	    pMonster:SetSuperArmor( true ) 
		pMonster:SetSpeedY( -0.2 )
		pMonster:SetNoCheckContact(110)
        pMonster:SetIgnoreFHCheck(false)
		pMonster:AddDamage( DT_BULTAROS03 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03DOWN" )
	end
	
	if( pMonster:IsLastBottom() == true ) then
	    pMonster:SetState( "ATTACK03LANDING" )
    end
end

--  버서커드라이브 착지 상태
function Bultaros_Attack03LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 ) then		
		pMonster:EarthQuake( 30, 0.06, 0.03 ) 
	elseif( iFrame == 3 ) then
		pMonster:AddParticle( "Bultaros_Berserkdrive_Boom_01", 0.0, -0.5 )
		pMonster:AddParticle( "Bultaros_Berserkdrive_Boom_02", 0.0, -0.5 )
		pMonster:AddParticle( "Bultaros_Berserkdrive_Boom_03", 0.0, -0.5 )
		pMonster:AddParticle( "Bultaros_Berserkdrive_Boom_04", 0.0, -0.5 )
		pMonster:AddParticle( "Bultaros_Berserkdrive_Boom_05", 0.0, -0.5 )
		pMonster:AddParticle( "Bultaros_Berserkdrive_Boom_06", 0.0, -0.5 )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  딥임팩트 요청 상태
function Bultaros_Astarot_MeteorFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 ) then
		pMonster:StartText("DANGER")		
	elseif( iFrame == 34 ) then
		local pAstarot = g_MyD3D:GetMonster( 0 )
		pAstarot:SetState( "FIRERAIN" )
		pAstarot:SetInvincible(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ASTAROT_METEOR02" )
	end
end

--  딥임팩트 요청02 상태
function Bultaros_Astarot_Meteor02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 죽는상태
function Bultaros_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(1041)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()		
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Bultaros_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Bultaros_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end


function Bultaros_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 150, -160, 200, 160, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Bultaros_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 500, -300, 300, 300, -60 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Bultaros_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then		
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03READY" )
		pMonster:ResetDelay()
	end
end

function Bultaros_Check_Astarot_Meteor( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetCountValue() >= 2 ) then	
		pMonster:SetCountValue(0)
		pMonster:SetState( "ASTAROT_METEOR" )
		pMonster:ResetDelay()
	end
end

function Bultaros_Check_Attack03_Target( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	
    if( iFrame >= 51 ) then
		pMonster:TurnToTarget()
        iTargetX = pMonster:GetTargetX()
        pMonster:SetX(iTargetX)
    end
end

function Bultaros_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Bultaros_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Bultaros_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 400, -400, -40, 400, -1000 ) == true ) then
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
function OnBultaros_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then		
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "WAIT" )
	elseif( pMonster:CheckState( "ATTACK03" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
	end
end

function OnBultaros_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnBultaros_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then		
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.04 and pMonster:IsSuperArmor() == false and pMonster:CheckState( "ASTAROT_METEOR" ) == false ) then			
		pMonster:SetState( "ATTACK03READY" )
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	
end

function Bultaros_MoveFail( iMonsterIndex )
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

function Bultaros_Jump( iMonsterIndex )
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

function Bultaros_MoveFail( iMonsterIndex )
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


