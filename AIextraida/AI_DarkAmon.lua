-- AI_DarkAmon.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "DarkAmon_Wait.frm",
        Func    = "DarkAmon_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "DarkAmon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkAmon_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkAmon_Check_Walk",
                DelayFrame          = 110,
            },
            -- 하이점프
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkAmon_Check_JumpUp",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 110,
                AIFunc              = "DarkAmon_Check_JumpDown",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "DarkAmon_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 몸통박치기
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkAmon_Check_Attack02",
                DelayFrame          = 165,
            },
            -- 다크에너지볼
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkAmon_Check_Attack03",
                DelayFrame          = 110,
            },
            -- 소울임팩트
            {
                AICheckFrame        = 165,
                AIFunc              = "DarkAmon_Check_Attack04",
                DelayFrame          = 550,
            },
            -- 다크토네이도
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkAmon_Check_Attack05",
                DelayFrame          = 440,
            },
			-- 아머캣 소환
            {
                AICheckFrame        = 165,
                AIFunc              = "DarkAmon_Check_Attack06",
                DelayFrame          = 2200,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "DarkAmon_Walk.frm",
        Func    = "DarkAmon_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "DarkAmon_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "DarkAmon_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkAmon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "DarkAmon_Check_JumpUp",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkAmon_Check_JumpDown",
                DelayFrame          = 75,
            },
			-- 근접공격
            {
                AICheckFrame        = 25,
                AIFunc              = "DarkAmon_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 몸통박치기
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkAmon_Check_Attack02",
                DelayFrame          = 165,
            },
            --[[
            -- 천지파열
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkAmon_Check_SpecialAttack",
                DelayFrame          = 550,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "DarkAmon_Check_Stop",
                DelayFrame          = 55,
            },--]]
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "DarkAmon_Attack01.frm",
        Func    = "DarkAmon_Attack01Func",
    },
    
    -- 파워차지(몸통박치기)
    {
        ID      = "ATTACK02",
        Motion  = "DarkAmon_Attack02.frm",
        Func    = "DarkAmon_Attack02Func",
    },
    
    -- 다크크래쉬
    {
        ID      = "ATTACK03",
        Motion  = "DarkAmon_Attack03.frm",
        Func    = "DarkAmon_Attack03Func",
    },
        
    -- 소울임팩트
    {
        ID      = "ATTACK04",
        Motion  = "DarkAmon_Attack04.frm",
        Func    = "DarkAmon_Attack04Func",
    },
    
    -- 다크토네이도
    {
        ID      = "ATTACK05",
        Motion  = "DarkAmon_Attack05.frm",
        Func    = "DarkAmon_Attack05Func",
    },
	
	-- 아머캣 소환
    {
        ID      = "ATTACK06",
        Motion  = "DarkAmon_Attack06.frm",
        Func    = "DarkAmon_Attack06Func",
    },
    
    -- 점프업
    {
        ID      = "JUMP",
        Motion  = "DarkAmon_Jump.frm",
        Func    = "DarkAmon_JumpFunc",
    },
    
    -- 점프다운
    {
        ID      = "JUMPDOWN",
        Motion  = "DarkAmon_JumpDown.frm",
        Func    = "DarkAmon_JumpDownFunc",
    },
    
    -- 착지
    {
        ID      = "LANDING",
        Motion  = "DarkAmon_Landing.frm",
        Func    = "DarkAmon_LandingFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "DarkAmon_Die.frm",
        Func    = "DarkAmon_DieFunc",
    },
}

CallBack =
{
    Land    = "OnDarkAmon_Land",
    Die     = "OnDarkAmon_Die",
    Damage  = "OnDarkAmon_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDarkAmon( iMonsterIndex )
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
	pMonster:RegisterSummonMonsterType( MON_ARMORCAT )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function DarkAmon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function DarkAmon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function DarkAmon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
        pMonster:PlaySound(368)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()        
    end
end

-- 데미지 입은거
function DarkAmon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function DarkAmon_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프 상태
function DarkAmon_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMPDOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 착지 상태
function DarkAmon_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function DarkAmon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame >= 10 and iFrame < 23 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame == 58 ) then
        pMonster:AddDamage( DT_DARK_AMON_PUNCH_COMBO1 )
		pMonster:PlaySound(369)
    elseif( iFrame == 78 ) then
        pMonster:AddDamage( DT_DARK_AMON_PUNCH_COMBO2 )
		pMonster:PlaySound(369)
    elseif( iFrame >= 80 and iFrame < 90 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
    elseif( iFrame == 115 ) then
		pMonster:AddDamage( DT_DARK_AMON_PUNCH_COMBO5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 파워차지(몸통박치기) 상태
function DarkAmon_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		pMonster:PlaySound(367)
	elseif( iFrame == 46 ) then
		pMonster:AddDamage( DT_DARK_AMON_DASH_ATK )
    elseif( iFrame == 50 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 5.0 )
	elseif( iFrame == 58 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

--  다크에너지볼 상태
function DarkAmon_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 20 or iFrame == 26 ) then		
		pMonster:SetFly( true )
		pMonster:SetNoCheckContact(65)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
		pMonster:SetSpeedY( 0.02 )
	elseif( iFrame == 46 ) then	
		pMonster:SetSpeedX( 0.0 )	
		pMonster:SetSpeedY( 0.0 )
		pMonster:PlaySound(369)
	elseif( iFrame == 67 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKENERGYBALL, 0.3, 0.35 )
	elseif( iFrame == 76 ) then
		pMonster:SetFly( false )	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  소울임팩트 상태
function DarkAmon_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
    elseif( iFrame == 29 ) then
        pMonster:SkillReadyEffect( 20, 20, 20, 0.0 )
    elseif( iFrame == 35 ) then
        pMonster:AddParticle( "dark-amon_effect01", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect02", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect03", 0.0, 0.5 )
	elseif( iFrame == 40 ) then
		pMonster:PlaySound(370)
    elseif( iFrame == 45 ) then
        pMonster:AddParticle( "dark-amon_effect05", 0.0, 0.4 )
        pMonster:AddParticle( "dark-amon_effect06", 0.0, 0.4 )
        pMonster:AddParticle( "dark-amon_effect07", 0.0, 0.4 )
    elseif( iFrame == 50 ) then
		pMonster:AddParticle( "dark-amon_effect04", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect08", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect09", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect10", 0.0, 0.5 )
    elseif( iFrame == 65 ) then
        pMonster:AddDamage( DT_DARK_AMON_SOUL_IMPACT )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  다크토네이도 상태
function DarkAmon_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 40 and iFrame <= 80 ) then
        pMonster:PullPlayer()
    end
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
	pMonster:PlaySound(371)
    elseif( iFrame == 39 ) then
        pMonster:AddBlackHoleEffect()
    elseif( iFrame == 85 ) then
        pMonster:SkillReadyEffect( 20, 20, 20, 0.0 )
    elseif( iFrame == 86 ) then
        pMonster:AddParticle( "darkwhirlpool01", 0.3, 0.5 ) 
        pMonster:AddParticle( "darkwhirlpool02", 0.3, 0.5 )
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 0.3, 0.1 )
	elseif( iFrame == 91 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 0.3, 0.5 )
	elseif( iFrame == 96 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 0.3, 0.9 )
	elseif( iFrame == 101 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO02, 0.3, 1.3 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  아머캣소환 상태
function DarkAmon_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
		pMonster:PlaySound(371)
    elseif( iFrame == 81 ) then
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_ARMORCAT
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_ARMORCAT
		pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function DarkAmon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function DarkAmon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function DarkAmon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function DarkAmon_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function DarkAmon_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		DarkAmon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function DarkAmon_Check_JumpDown( iMonsterIndex, iFrame )
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

function DarkAmon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 200, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function DarkAmon_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -200, 300, 200, -60 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function DarkAmon_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -100, 0, 100, -250 ) == true or pMonster:CheckTargetInRange( 400, -100, -250, 100, -500 ) == true ) then		
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function DarkAmon_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -300, 400, 300, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function DarkAmon_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -200, 1000, 200, -1000 ) == false ) then
		pMonster:SetCountValue(0)
		pMonster:SetSpeedX( 0.0 )            
		pMonster:SetSpeedY( 0.0 )            
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function DarkAmon_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetSpeedX( 0.0 )            
		pMonster:SetSpeedY( 0.0 )            
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDarkAmon_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then		
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
	elseif( pMonster:CheckState( "ATTACK03" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
	end
end

function OnDarkAmon_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnDarkAmon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then		
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.002 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.1 ) then			
			pMonster:SetState( "ATTACK04" )	
		else
			pMonster:SetState( "ATTACK02" )	
		end
		pMonster:TurnToTarget()
        pMonster:SetSuperArmor(true)
	end
	
end

function DarkAmon_Jump( iMonsterIndex )
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

function DarkAmon_MoveFail( iMonsterIndex )
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

