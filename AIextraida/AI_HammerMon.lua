-- AI_HammerMon.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "hammer_mon_wait.frm",
        Func    = "FireGolem_WaitFunc",

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
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "FireGolem_Check_Walk",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 25,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 30,
            },
            -- 파이어브레스
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 220,
            },
            -- 지진공격
            {
                AICheckFrame        = 250,
                AIFunc              = "FireGolem_Check_Attack03",
                DelayFrame          = 220,
            },
            
            -- 상단 로켓
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack05",
                DelayFrame          = 220,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "hammer_mon_move.frm",
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
                DelayFrame          = 220,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "FireGolem_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "hammer_mon_right_outside_punch.frm",
        Func    = "FireGolem_Attack01Func",
    },
    
    -- 아래 치기
    {
        ID      = "ATTACK02",
        Motion  = "hammer_mon_rocket_punch.frm",
        Func    = "FireGolem_Attack02Func",
    },
    
    -- 지진공격
    {
        ID      = "ATTACK03",
        Motion  = "hammer_mon_earthquake_attack.frm",
        Func    = "FireGolem_Attack03Func",
    },
    
    -- 근접공격 
    {
        ID      = "ATTACK04",
        Motion  = "hammer_mon_right_punch.frm",
        Func    = "FireGolem_Attack04Func",
    },
    -- 위치기
    {
        ID      = "ATTACK05",
        Motion  = "hammer_mon_rocket_upper_punch.frm",
        Func    = "FireGolem_Attack05Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "hammer_mon_die.frm",
        Func    = "FireGolem_DieFunc",
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

function InitHammerMon( iMonsterIndex )
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
    if( iFrame == 135 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )
    end
    
    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function FireGolem_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 39 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )
    end
    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
	
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
    elseif( iFrame == 30 ) then
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 )
    elseif( iFrame == 52 ) then
		pMonster:PlaySound( "244" )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.1, 22, 23, 4 )
	elseif( iFrame == 65 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 롸켓
function FireGolem_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 111 ) then
        pMonster:PlaySound( "341" )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.05, 22, 23, 7 )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.05, 13, 14, 7 )
	elseif( iFrame == 155 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  지진공격 상태
function FireGolem_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
        pMonster:StartText( "JUMP" )
    elseif( iFrame == 91 ) then
		pMonster:SkillReadyEffect( 0, 0, 0, 0.0 )
    elseif( iFrame == 125 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
		
	elseif( iFrame == 175 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  근접공격 상태
function FireGolem_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
		pMonster:PlaySound( "343" )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.1, 22, 23, 3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



-- 롸켓
function FireGolem_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 47 ) then
        pMonster:PlaySound( "343" )
		pMonster:StartAttack( 9 ,PAR_FRONTDOWN_DROPDAMAGE_1, 0.1, 22, 23, 8 )		
	elseif( iFrame == 61 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )
    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function FireGolem_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
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

    if( pMonster:CheckTargetInRange( 150, -120, 50, 120, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -100, 0, 100, -350 ) == true or
        pMonster:CheckTargetInRange( -200, -100, 0, 100, -380 ) == true ) then		
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "ATTACK03" )
	pMonster:ResetDelay()

end


function FireGolem_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -150, 350, 150, 100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnFireGolem_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
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
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end
