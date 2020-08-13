-- AI_Thanatos3.lua

ActionList =
{	
	-- 대기
	{
		ID	= "WAIT",
		Motion  = "Thanatos3_Wait.frm",
		Func	= "Thanatos3_WaitFunc",

		Trigger =
		{
			-- 타게팅
			{
				AICheckFrame	= 20,
				AIFunc			= "Thanatos3_Check_Targeting",
				DelayFrame		= 20,
			},

			-- 타겟을 향해 턴
			{
				AICheckFrame	= 15,
				AIFunc			= "Thanatos3_Check_TurnToTarget",
				DelayFrame		= 25,
			},

			-- 달리기
			{
				AICheckFrame	= 100,
				AIFunc			= "Thanatos3_Check_Run",
				DelayFrame		= 200,
			},

			-- 지배
			{
				AICheckFrame	= 200,
				AIFunc			= "Thanatos3_Check_Attack01",
				DelayFrame		= 600,
				DelayFrame1		= 400,
				DelayFrame2		= 200,
				DelayFrame3		= 200,
			},

			-- 없음
			--{
			--	AICheckFrame	= 1,
			--	AIFunc			= "Thanatos3_Check_Attack02",
			--	DelayFrame		= 1,
			--},

			-- 오른손
			{
				AICheckFrame	= 30,
				AIFunc			= "Thanatos3_Check_Attack03",
				DelayFrame		= 220,
			},

			-- 왼손
			{
				AICheckFrame	= 222,
				AIFunc			= "Thanatos3_Check_Attack04",
				DelayFrame		= 40,
			},

			-- 중력홀
			{
				AICheckFrame	= 200,
				AIFunc			= "Thanatos3_Check_Attack05",
				DelayFrame		= 100,
			},

			-- =ㅅ=
			{
				AICheckFrame	= 150,
				AIFunc			= "Thanatos3_Check_Attack06",
				DelayFrame		= 50,
			},

		},
	},
	
	--  달리기
	{
		ID	= "RUN",
		Motion  = "Thanatos3_walk.frm",
		Func	= "Thanatos3_RunFunc",

		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame	= 20,
				AIFunc			= "Thanatos3_Check_TurnToTarget",
				DelayFrame		= 20,
			},
			--[[
			-- 멈추기
			{
				AICheckFrame	= 10,
				AIFunc			= "Thanatos3_Check_RunStop",
				DelayFrame		= 30,
			},
			--]]
		}
	},
	
	-- 죽기02
	{
		ID	= "DIE_LANDING",
		Motion  = "Thanatos3_Die.frm",
		Func	= "Thanatos3_DieFunc",
	},
	
	-- 잡아먹기
	{
		ID	= "ATTACK01",
		Motion  = "Thanatos3_attack01.frm",
		Func	= "Thanatos3_Attack01Func",
	},
	
	-- 바닥찍기
	{
		ID	= "ATTACK03",
		Motion  = "Thanatos3_Attack03.frm",
		Func	= "Thanatos3_Attack03Func",
	},
	
	-- 생명의 섬광
	{
		ID	= "ATTACK04",
		Motion  = "Thanatos3_Attack04.frm",
		Func	= "Thanatos3_Attack04Func",
	},
	
	-- 파괴의 섬광
	{
		ID	= "ATTACK05",
		Motion  = "Thanatos3_Attack05.frm",
		Func	= "Thanatos3_Attack05Func",
	},
	
	-- 근접공격
	{
		ID	= "ATTACK06",
		Motion  = "Thanatos3_Attack06.frm",
		Func	= "Thanatos3_Attack06Func",
	},
	
	{
		ID	= "STUN",
		Motion  = "Thanatos3_Wait.frm",
		Func	= "Thanatos3_StunFunc",
	},
}

CallBack =
{
	Land	= "OnThanatos3_Land",
	Die	= "OnThanatos3_Die",
	Damage  = "OnThanatos3_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitThanatos3( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:InitTimer()
	pMonster:StartTimer()
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Thanatos3_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 8
	pMonster:ToggleRender( true )
	pMonster:SetPushCheck( true )
	pMonster:SetInvincible( false )
	
	if( pMonster:GetTimer() >= 200 ) then
		pMonster:AddDamage(DT_THANATOS3_MARKS)
		pMonster:InitTimer()
		pMonster:StartTimer()
	end

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

-- 대기 상태
function Thanatos3_StunFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 8
	
	pMonster:ToggleRender( true )
	pMonster:SetPushCheck( true )
	pMonster:SetInvincible( false )
	
	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- 달리기 상태
function Thanatos3_RunFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	
	if( iFrame == 20 ) then
		local posy = 1.1
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Thanatos_Dash_01", 0.0, posy)
			pMonster:AddParticleNoDirection("Thanatos_Dash_02", 0.0, posy)
		else
			pMonster:AddParticleNoDirection("Thanatos_Dash_01_R", 0.0, posy)
			pMonster:AddParticleNoDirection("Thanatos_Dash_02_R", 0.0, posy)
		end
		pMonster:SetInvincibleFrame( 20 )
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetX( pMonster:GetTargetX() )
	elseif( iFrame == 40 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
		pMonster:SetInvincible( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 죽는상태
function Thanatos3_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(995014)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
	end
end

-- 데미지 입은거
function Thanatos3_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	--pMonster:PlaySound(1036)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Thanatos3_ToWaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Thanatos3_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 49 ) then
		local posx = 0.0
		local posy = 0.0
		pMonster:AddParticle("Thanatos_Mind_Control_01", posx, posy, true)
		pMonster:AddDamage(DT_THANATOS3_TAKEUNDERCONTROL)
	elseif( iFrame == 53 ) then
		pMonster:PlaySound(995009)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Thanatos3_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 90 ) then
		pMonster:AddDamage(DT_THANATOS3_RIGHTHAND)
	elseif( iFrame == 97 ) then
		local particleX = 0.7
		local particleY = 1.7
		pMonster:AddParticle( "Thanatos_Righthand_01", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_02", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_03", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_04", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_05", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_06", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_07", particleX, particleY )
		pMonster:AddParticle( "Thanatos_Righthand_08", particleX, particleY )
		pMonster:PlaySound(995010)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Thanatos3_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 73 ) then
		pMonster:AddDamage(DT_THANATOS3_LEFTHAND)
	elseif( iFrame == 79 ) then
		pMonster:PlaySound(995011)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Thanatos3_Attack05Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= 50 and iFrame <= 132 ) then
		pMonster:PullPlayer( 0.6, 1.2 )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 45 ) then
		pMonster:AddDamage(DT_THANATOS3_GRAVITY_HOLE)
	elseif( iFrame == 50 ) then
		pMonster:PlaySound(995012)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function Thanatos3_Attack06Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 38 ) then
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(995013)
		local particleX = 0.10
		local particleY = 1.9
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_01", particleX, particleY )
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_02", particleX, particleY )
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_03", particleX, particleY )
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_04", particleX, particleY )
		particleX = -0.4 
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_01", particleX, particleY )
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_02", particleX, particleY )
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_03", particleX, particleY )
		pMonster:AddParticle( "Jin2_SPECIAL3_Boom_04", particleX, particleY )
		
		local angle1 = 0.7
		local angle2 = 0.5
		local angle3 = 1.8
		local angle4 = 1.5
		if( pMonster:GetIsRight() ) then
		else
		    angle1 = -angle1
		    angle2 = -angle2
		    angle3 = -angle3
		    angle4 = -angle4
		end
		pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_L, 0.1, 1.9, false, angle1 )
		pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_L, 0.1, 1.9, false, angle2 )		
		pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_R, -0.4, 1.9, false, angle3 )
		pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_R, -0.4, 1.9, false, angle4 )
		pMonster:SetTarget( 0, -1600, 1000, 1600, -1000 )
	elseif( iFrame == 125 ) then	    
		if( pMonster:GetIsRight() ) then
		    pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()-0.55, pMonster:GetTargetY() + 1.5, true, -1.2  )
	        
	    else
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()-0.55, pMonster:GetTargetY() + 1.5, true, 1.94  )
	    end
	elseif( iFrame == 137 ) then	    
	    if( pMonster:GetIsRight() ) then
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()-0.3, pMonster:GetTargetY() + 1.5, true, -1.37 )
	    else
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()-0.3, pMonster:GetTargetY() + 1.5, true, 1.77 )	        
	    end
	        
	elseif( iFrame == 144 ) then	    
	    if( pMonster:GetIsRight() ) then
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()+0.3, pMonster:GetTargetY() + 1.5, true, -1.77 )
	    else
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()+0.3, pMonster:GetTargetY() + 1.5, true, 1.37 )	        
	    end
	        
	elseif( iFrame == 151 ) then	    
	    if( pMonster:GetIsRight() ) then
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()+0.55, pMonster:GetTargetY() + 1.5, true, -1.94 )	
	    else
	        pMonster:AddDamageWithLocateAngle( DT_THANATOS3_ATTACK6_MISSILE_DOWN, pMonster:GetTargetX()+0.55, pMonster:GetTargetY() + 1.5, true, 1.2 )	
	    end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Thanatos3_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -1600, 1000, 1600, -100 ) == true ) then
		pMonster:ResetDelay()
	end
end

function Thanatos3_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Thanatos3_Check_Run( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 250, -250, 1000, 250, -100 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end
end

function Thanatos3_Check_RunStop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == false or pMonster:CheckTargetInRange( 250, -250, 1000, 250, -100 ) == true ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
	end
end

function Thanatos3_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "ATTACK01" )
	pMonster:ResetDelay()
end

function Thanatos3_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 200, -200, 1000, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Thanatos3_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 800, -800, 1000, 800, -100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Thanatos3_Check_Attack05( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	pMonster:SetState( "ATTACK05" )
	pMonster:ResetDelay()
end

function Thanatos3_Check_Attack06( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
	end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnThanatos3_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
end

function OnThanatos3_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE_LANDING" )
end

function OnThanatos3_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.15 and pMonster:CheckState("WAIT") ) then
		pMonster:TurnToTarget()
	end
end
