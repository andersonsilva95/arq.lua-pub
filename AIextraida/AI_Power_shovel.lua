-- AI_Power_Shovel.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Power_Shovel_Wait.frm",
        Func    = "Power_Shovel_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Power_Shovel_Check_Targeting",
                DelayFrame          = 60,
            },

            -- 타겟지움
            --{
            --	AICheckFrame        = 300,
            --	AIFunc              = "Power_Shovel_Check_ReleaseTarget",
            --	DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Power_Shovel_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- 걷기
            {
                AICheckFrame        = 40,
                AIFunc              = "Power_Shovel_Check_Walk",
                DelayFrame          = 40,
            },

            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "Power_Shovel_Check_JumpUp",
                DelayFrame          = 60,
            },        

            -- 점프다운
            {
                AICheckFrame        = 42,
                AIFunc              = "Power_Shovel_Check_JumpDown",
                DelayFrame          = 40,
            },

			-- 셔블 암
            {
                AICheckFrame        = 10,
                AIFunc              = "Power_Shovel_Check_Attack01",
                DelayFrame          = 90,
            },

            -- 롤링 챠지
            {
                AICheckFrame        = 30,
                AIFunc              = "Power_Shovel_Check_Attack02",
                DelayFrame          = 240,
            },

            -- 네이팜 러쉬
            {
                AICheckFrame        = 25,
                AIFunc              = "Power_Shovel_Check_Attack03",
                DelayFrame          = 255,
            },

			-- 뉴클리어
            {
                AICheckFrame        = 275,
                AIFunc              = "Power_Shovel_Check_Attack04",
                DelayFrame          = 550,
            },

		},
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Power_Shovel_move.frm",
        Func            = "Power_Shovel_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Power_Shovel_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 20,
                AIFunc              = "Power_Shovel_Check_Targeting",
                DelayFrame          = 60,
            },
            -- 타겟지움
            --{
            --	AICheckFrame        = 200,
            --	AIFunc              = "Power_Shovel_Check_ReleaseTarget",
            --	DelayFrame          = 100,
            --},
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Power_Shovel_Check_TurnToTarget",
                DelayFrame          = 30,
            },
            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "Power_Shovel_Check_JumpUp",
                DelayFrame          = 60,
            },        
            -- 점프다운
            {
                AICheckFrame        = 42,
                AIFunc              = "Power_Shovel_Check_JumpDown",
                DelayFrame          = 40,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Power_Shovel_Check_Stop",
                DelayFrame          = 100,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Power_Shovel_Attack01.frm",
        Func    = "Power_Shovel_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Power_Shovel_Attack02.frm",
        Func    = "Power_Shovel_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "Power_Shovel_Attack03.frm",
        Func    = "Power_Shovel_Attack03Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK04",
        Motion  = "Power_Shovel_Attack04.frm",
        Func    = "Power_Shovel_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Power_Shovel_Jump_Up.frm",
        Func    = "Power_Shovel_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Power_Shovel_Jump_Down.frm",
        Func    = "Power_Shovel_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Power_Shovel_Jump_Landing.frm",
        Func    = "Power_Shovel_ToWait",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Power_Shovel_Die.frm",
        Func    = "Power_Shovel_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnPower_Shovel_Land",
    Die     = "OnPower_Shovel_Die",
    Damage  = "OnPower_Shovel_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitPower_Shovel( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:ToggleExtraMesh("NUCLEAR", true)
    pMonster:AddTraceParticleToBone( "Shovel_Steam", 1.0, 16, 8, 8, 0.0, 0.2 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Power_Shovel_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Power_Shovel_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    Power_Shovel_Smoke(iMonsterIndex, iFrame)

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function Power_Shovel_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(989009)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Power_Shovel_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Power_Shovel_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(989010)
    elseif( iFrame == 65 ) then
		pMonster:StartAttack( 9, 7, 0.6, 7, 7, 3)
    elseif( iFrame == 69 ) then
		local posx = 0.61
		pMonster:AddParticle("Power_Shovel_Arm_01", posx, 0.0 )
		pMonster:AddParticle("Power_Shovel_Arm_02", posx, 0.0 )
		pMonster:AddParticle("Power_Shovel_Arm_03", posx, 0.0 )
		pMonster:AddParticle("Power_Shovel_Arm_04", posx, 0.0 )
		pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Power_Shovel_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= 70 and iFrame < 140) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() *2 )
		if( iFrame == 70 ) then
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK2)
			pMonster:PlaySound(989011)
			
			local posx = 0.0
			local posy = 0.0
			
			pMonster:AddTraceParticleToBone( "Shovel_Dash_Body_01", 1.0, -1, 8, 8, posx, posy+0.2, true )
			pMonster:AddTraceParticleToBone( "Shovel_Dash_Body_02", 1.0, -1, 8, 8, posx, posy+0.2, true )
			
			if( pMonster:GetIsRight() ) then
				pMonster:AddTraceParticleToBone( "Shovel_Dash_01", 1.0, -1, 8, 8, posx + 0.1, posy, true )
				pMonster:AddTraceParticleToBone( "Shovel_Dash_02", 1.0, -1, 8, 8, posx + 0.1, posy, true )
				pMonster:AddTraceParticleToBone( "Shovel_Dash_02", 1.0, -1, 8, 8, posx - 0.1, posy, true )
				pMonster:AddTraceParticleToBone( "Shovel_Dash_02", 1.0, -1, 8, 8, posx - 0.3, posy, true )
			else
				posx = posx * -1.0
				pMonster:AddTraceParticleToBone( "Shovel_Dash_01_R", 1.0, -1, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Shovel_Dash_02_R", 1.0, -1, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Shovel_Dash_02_R", 1.0, -1, 8, 8, posx + 0.3, posy, true )
			end
		end
	elseif( iFrame == 140 ) then
		pMonster:SetSpeedX( 0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Power_Shovel_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(989013)
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_1)
		else
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02_R", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_1_R)
		end
	elseif( iFrame == 70 ) then
		pMonster:PlaySound(989013)
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_2)
		else
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02_R", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_2_R)
		end
	elseif( iFrame == 83 ) then
		pMonster:PlaySound(989013)
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_3)
		else
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02_R", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_3_R)
		end
	elseif( iFrame == 97 ) then
		pMonster:PlaySound(989013)
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_4)
		else
			pMonster:AddTraceParticleToBone( "Shovel_Shot_01", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Shovel_Shot_02_R", 1.0, 10, 8, 8, posx, posy, true )
			pMonster:AddDamage(DT_POWER_SHOVEL_ATK3_4_R)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

local posNx
local posNy
--  
function Power_Shovel_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
	
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		pMonster:ClearChildMeshOneTimeMotion( "NUCLEAR" )
		pMonster:SetChildMeshMotion("NUCLEAR", "Power_Shovel_attack04_nuclear", true, true )
	elseif( iFrame == 53 ) then
		posNx = pMonster:GetTargetX()
		posNy = pMonster:GetTargetY()
		pMonster:PlaySound(989015)
		pMonster:AddParticleToChildMeshBone("NUCLEAR", "Power_Shovel_Nuclear_Tail", 3, 0.0, 0.0, 0.0, true )
		pMonster:AddDamageWithLocate( DT_POWER_SHOVEL_ATK4_INDICATOR, posNx, posNy, true )
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(989016)
	elseif( iFrame == 158 ) then
		--pMonster:AddDamageWithLocate( DT_POWER_SHOVEL_ATK4, posNx, posNy, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ClearChildMeshOneTimeMotion( "NUCLEAR" )
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Power_Shovel_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 20 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 20 ) then
		Power_Shovel_Jump( iMonsterIndex )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function Power_Shovel_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Power_Shovel_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Power_Shovel_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame == 1 ) then
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Power_Shovel_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -600, 360, 600, -300 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function Power_Shovel_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -800, 460, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -350, 800, 350, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Power_Shovel_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -350, 800, 350, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 180, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -300, 180, 300, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 600, -250, 360, 250, -240 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 330, 300, -380 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 800, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Power_Shovel_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -100, 200, -800 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnPower_Shovel_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnPower_Shovel_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnPower_Shovel_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true ) then
			if ( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04" )
			else
				pMonster:TurnToTarget()
				pMonster:SetState( "ATTACK02" )
			end
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function Power_Shovel_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Power_Shovel_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	--[[
	if( pMonster:GetIsContact() == true )then
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -pMonster:GetWalkSpeed() )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() )        
        end
	end
	--]]
	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			--pMonster:SetSpeedY( 0.015 )
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			--pMonster:SetSpeedY( 0.018 )		
		end
	end
end


function Power_Shovel_Smoke( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( math.mod( iFrame, 100 ) == 1 ) then
		local posx = 0.0
		local posy = 0.0
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Keeper_Steam", 1.0, 19, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Keeper_Steam", 1.0, 21, 8, 8, posx, posy )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Keeper_Steam_R", 1.0, 19, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Keeper_Steam_R", 1.0, 21, 8, 8, posx, posy, true )
		end
    end
end