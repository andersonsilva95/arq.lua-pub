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
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Walk",
                DelayFrame          = 110,
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
            -- 지진공격
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack03",
                DelayFrame          = 220,
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
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "GiantStoneGolem_Die.frm",
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
			pMonster:AddParticle( "firegolem_breath", 0.3, 0.31 )
		end
		
		if( math.mod( iFrame, 8 ) == 0 ) then
			pMonster:AddDamage( DT_GOLEM_FIRE )
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
