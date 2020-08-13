-- AI_FireGolem.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "GiantStoneGolem_Wait.frm",
        Func    = "FireGolem_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Targeting",
                DelayFrame          = 330,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 75,
            },

            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Walk",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 파이어브레스
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 110,
            },
            -- 지진공격
            {
                AICheckFrame        = 330,
                AIFunc              = "FireGolem_Check_Attack03",
                DelayFrame          = 750,
				DelayFrame1         = 660,
				DelayFrame2         = 430,
            },
            
            -- 분노의 화염기둥
            {
                AICheckFrame        = 145,
                AIFunc              = "FireGolem_Check_Attack04",
                DelayFrame          = 110,
            },

            -- 불덩어리 던지기
            {
                AICheckFrame        = 30,
                AIFunc              = "FireGolem_Check_Attack05",
                DelayFrame          = 30,
            },

            -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "FireGolem_Check_HighJump",
                DelayFrame          = 40,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "FireGolem_Check_JumpDown",
                DelayFrame          = 40,
            },

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "GiantStoneGolem_Walk.frm",
        Func    = "FireGolem_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "FireGolem_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 220,
            },
            -- 파이어브레스
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 110,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "FireGolem_Check_Stop",
                DelayFrame          = 55,
            },
       
            -- 불덩어리 던지기
            {
                AICheckFrame        = 45,
                AIFunc              = "FireGolem_Check_Attack05",
                DelayFrame          = 30,
            },
            
            -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "FireGolem_Check_HighJump",
                DelayFrame          = 40,
            },        
            -- 점프다운
            {
                AICheckFrame        = 110,
                AIFunc              = "FireGolem_Check_JumpDown",
                DelayFrame          = 220,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "GiantStoneGolem_Attack01.frm",
        Func    = "FireGolem_Attack01Func",
    },
    
    -- 파이어브레스
    {
        ID      = "ATTACK02",
        Motion  = "GiantStoneGolem_Attack02.frm",
        Func    = "FireGolem_Attack02Func",
    },
    
    -- 지진공격
    {
        ID      = "ATTACK03",
        Motion  = "GiantStoneGolem_Attack03.frm",
        Func    = "FireGolem_Attack03Func",
    },
    
    -- 불덩어리 던지기
    {
        ID      = "ATTACK05",
        Motion  = "fire_golem_hero_attack01.frm",
        Func    = "MiniFireGolem_Attack05Func",
    },
    
    -- 분노의 불기둥_소리지르기
    {
        ID      = "ATTACK04",
        Motion  = "fire_golem_hero_attack02_01.frm",
        Func    = "MiniFireGolem_Attack04_1Func",
    },
    
    -- 분노의 불기둥_땅찍기
    {
        ID      = "ATTACK04_2",
        Motion  = "fire_golem_hero_attack02_02.frm",
        Func    = "MiniFireGolem_Attack04_2Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "GiantStoneGolem_Die.frm",
        Func    = "FireGolem_DieFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "MiniGolem_Jump_up.frm",
        Func    = "FireGolem_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "minigolem_jump_down.frm",
        Func    = "FireGolem_JumpDownFunc",
        
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "FireGolem_Check_Landing",
                DelayFrame          = 1,
            },
        },
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "minigolem_jump_landing.frm",
        Func    = "FireGolem_ToWait",
    },
}

CallBack =
{
    Land    = "OnFireGolem_Land",
    Die     = "OnFireGolem_Die",
    Damage  = "OnFireGolem_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitFireGolem( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
--]]
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function FireGolem_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function FireGolem_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 81 ) then
		pMonster:PlaySound( "282" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound( "282" )
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function FireGolem_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 )then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- 데미지 입은거
function FireGolem_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function FireGolem_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 72 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_ICE_GOLEM_PUNCH )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  파이어브레스 상태
function FireGolem_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= 80 and iFrame < 133 ) then
		if( iFrame == 80 ) then
			pMonster:PlaySound( "27" )
			pMonster:AddParticle( "firegolem_breath", 0.47, 0.46 )
		end
		
		if( math.mod( iFrame, 8 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_GOLEM_FIRE,0, 0.2 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  지진공격 상태
function FireGolem_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
		pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 )
    elseif( iFrame == 76 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  파이어브레스흉내내기 상태
function MiniFireGolem_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 70 ) then
		pMonster:ComputeAngleToTarget( 0.4, 0.62 ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_HERO_FIREGOLEM_ATK1, 0.4, 0.62, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_HERO_FIREGOLEM_ATK1_R, 0.4, 0.62, false, -angle )
		end
	elseif( iFrame == 73 ) then
		pMonster:PlaySound( "986004" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  파이어브레스흉내내기 상태
function MiniFireGolem_Attack04_1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:PlaySound( "986002" )
	elseif( iFrame == 60 ) then
		pMonster:AddDamageWithLocate(DT_HERO_FIREGOLEM_ATK2_STARTER , 0.2, 1.0, true )
		pMonster:AddDamageWithLocate(DT_HERO_FIREGOLEM_ATK2_STARTER , 1.7, 0.4, true )
		pMonster:AddDamageWithLocate(DT_HERO_FIREGOLEM_ATK2_STARTER , 3.2, 0.6, true )
		pMonster:AddDamageWithLocate(DT_HERO_FIREGOLEM_ATK2_STARTER , 4.0, 1.2, true )
		pMonster:AddDamageWithLocate(DT_HERO_FIREGOLEM_ATK2_STARTER , 4.0, 1.2, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK04_2" )
    end
end

--  파이어브레스흉내내기 상태
function MiniFireGolem_Attack04_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 35 ) then
		pMonster:PlaySound( "986006" )
	elseif( iFrame == 73 ) then
		pMonster:PlaySound( "986006" )
	elseif( iFrame == 110 ) then
		pMonster:PlaySound( "986006" )
	elseif( iFrame == 158 ) then
		pMonster:PlaySound( "986006" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end




--  점프 상태
function FireGolem_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
		pMonster:SetSuperArmor(true)
    end
end

--  점프 다운 상태
function FireGolem_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
		pMonster:SetSuperArmor(true)
    end
end

--  점프 상태
function FireGolem_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function FireGolem_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1500, 800, 1500, -200 ) == true ) then
        pMonster:ResetDelay()
    end
end

function FireGolem_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function FireGolem_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function FireGolem_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function FireGolem_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 200, 150, -100 ) == true and pMonster:GetCountValue() >= 2 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 400, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end



function FireGolem_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 700, -700, 500, 700, -500 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:CheckTargetInRange( 150, -150, 100, 150, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    --end
end

function FireGolem_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -600, 500, 600, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		FireGolem_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -400, -40, 400, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Landing( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetIsContact() == true ) then
		pMonster:SetState( "JUMP_LANDING" )
		pMonster:ResetDelay()
    end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnFireGolem_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnFireGolem_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnFireGolem_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK04" )	
		else
			pMonster:SetState( "ATTACK05" )	
		end
		pMonster:TurnToTarget()
        pMonster:SetSuperArmor(true)
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end


function FireGolem_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
	
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
    end
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end