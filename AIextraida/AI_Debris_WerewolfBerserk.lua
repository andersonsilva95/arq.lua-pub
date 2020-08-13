-- AI_werewolf_berserker.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "werewolf_berserker_Wait.frm",
        Func    = "werewolf_berserker_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "werewolf_berserker_Targeting",
                DelayFrame          = 100,
            },
            -- 타겟지움
            {
                AICheckFrame        = 550,
                AIFunc              = "werewolf_berserker_Check_ReleaseTarget",
                DelayFrame          = 330,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "werewolf_berserker_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- 걷기 [75%]
            {
                AICheckFrame        = 35,
                AIFunc              = "werewolf_berserker_Check_Walk",
                DelayFrame          = 20,
            },

           -- 점프업
            {
                AICheckFrame        = 32,
                AIFunc              = "werewolf_berserker_Check_JumpUp",
                DelayFrame          = 50,
            },        

            -- 점프다운
            {
                AICheckFrame        = 31,
                AIFunc              = "werewolf_berserker_Check_JumpDown",
                DelayFrame          = 30,
            },

			-- 해비 파우
            {
                AICheckFrame        = 15,
                AIFunc              = "werewolf_berserker_Check_Attack01",
                DelayFrame          = 110,
            },

            -- 퀵 파우
            {
                AICheckFrame        = 70,
                AIFunc              = "werewolf_berserker_Check_Attack02",
                DelayFrame          = 330,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "werewolf_berserker_walk.frm",
        Func            = "werewolf_berserker_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "werewolf_berserker_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "werewolf_berserker_Targeting",
                DelayFrame          = 50,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "werewolf_berserker_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 해비 파우
            {
                AICheckFrame        = 5,
                AIFunc              = "werewolf_berserker_Check_Attack01",
                DelayFrame          = 40,
            },
            -- 멈추기
            {
                AICheckFrame        = 3,
                AIFunc              = "werewolf_berserker_Check_Stop",
                DelayFrame          = 20,
            },
        }
    },

    -- 자매여 영원하라~
    {
        ID      = "ATTACK01",
        Motion  = "werewolf_berserker_Attack01.frm",
        Func    = "werewolf_berserker_Attack01Func",
    },
    
    -- 단검 던지기
    {
        ID      = "ATTACK02",
        Motion  = "werewolf_berserker_Attack02.frm",
        Func    = "werewolf_berserker_Attack02Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "werewolf_berserker_jump_up.frm",
        Func    = "werewolf_berserker_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "werewolf_berserker_jump_down.frm",
        Func    = "werewolf_berserker_JumpDownFunc",
    },

    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "werewolf_berserker_Jump_Landing.frm",
        Func    = "werewolf_berserker_ToWait",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "werewolf_berserker_die.frm",
        Func    = "werewolf_berserker_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "Onwerewolf_berserker_Land",
    Die     = "Onwerewolf_berserker_Die",
    Damage  = "Onwerewolf_berserker_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initwerewolf_berserker( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.3 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.3 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.3 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.3 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function werewolf_berserker_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function werewolf_berserker_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function werewolf_berserker_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(984022)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  근접공격 상태
function werewolf_berserker_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	local strParticle1 = "Werewolf_B_Hook_01_R"
	local strParticle2 = "Werewolf_B_Hook_02_R"
	local xPos = -0.32
	
	if( pMonster:GetIsRight() ) then
		strParticle1 = "Werewolf_B_Hook_01"
		strParticle2 = "Werewolf_B_Hook_02"
		xPos = 0.32
	end
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 43 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK1)
		pMonster:AddParticleNoDirection( strParticle1, xPos, 0.33 )
		pMonster:AddParticleNoDirection( strParticle2, xPos, 0.33 )
		pMonster:PlaySound(984015)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function werewolf_berserker_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	local strParticleName1 = "Werewolf_B_QuickScratch_01_R"
	local strParticleName2 = "Werewolf_B_Swing_02_R"
	local strParticleName3 = "Werewolf_B_Swing_03_R"
	local xPos = -0.32
	if( pMonster:GetIsRight() ) then
		strParticleName1 = "Werewolf_B_QuickScratch_01"
        strParticleName2 = "Werewolf_B_Swing_02"
        strParticleName3 = "Werewolf_B_Swing_03"
		xPos = 0.32
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 66 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_1)
		pMonster:AddParticleNoDirection( strParticleName1, xPos, 0.32 ) 
		pMonster:AddParticleNoDirection( "Werewolf_B_QuickScratch_02", xPos, 0.32 )
		pMonster:PlaySound(984016)
	elseif( iFrame == 77 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_1)
		pMonster:PlaySound(984016)
	elseif( iFrame == 83 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_2)
		pMonster:PlaySound(984016)
	elseif( iFrame == 90 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_1)
		pMonster:PlaySound(984016)
	elseif( iFrame == 97 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_2)
		pMonster:PlaySound(984016)
	elseif( iFrame == 105 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_1)
		pMonster:PlaySound(984016)
	elseif( iFrame == 121 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_BERSERK_ATK2_3)
	    pMonster:AddParticle( "Werewolf_B_Swing_01", 0.2, 0.25 )
	    pMonster:AddParticleNoDirection( strParticleName2, xPos, 0.32 )
	    pMonster:AddParticleNoDirection( strParticleName3, xPos, 0.32 )
		pMonster:PlaySound(984016)
	    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function werewolf_berserker_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	       pMonster:SetFrameLock( true )

    end
end

--  점프 다운 상태
function werewolf_berserker_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function werewolf_berserker_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function werewolf_berserker_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -2400, 1000, 2400, -1000 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function werewolf_berserker_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1200, 800, 1200, -800 ) == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function werewolf_berserker_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function werewolf_berserker_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -240, 1000, 240, -1000 ) == false and pMonster:FloatRand() < 0.75 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function werewolf_berserker_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -240, 1000, 240, -1000 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function werewolf_berserker_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, 180, 120, -90 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function werewolf_berserker_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
		
	if( pMonster:CheckTargetInRange( 120, -120, 180, 120, -90 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function werewolf_berserker_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 220, -220, 1200, 220, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		werewolf_berserker_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function werewolf_berserker_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -1200 ) == true ) then
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
function Onwerewolf_berserker_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function Onwerewolf_berserker_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function Onwerewolf_berserker_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function werewolf_berserker_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5

	if (fTargetY - fMonY == 0.0) then
		fTargetY = fMonY + 0.01
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function werewolf_berserker_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end