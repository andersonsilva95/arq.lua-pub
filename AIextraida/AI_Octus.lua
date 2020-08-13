-- AI_Octus.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Octus_Wait.frm",
        Func    = "Octus_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Octus_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Octus_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 하이점프
            {
                AICheckFrame        = 55,
                AIFunc              = "Octus_Check_JumpUp",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 75,
                AIFunc              = "Octus_Check_JumpDown",
                DelayFrame          = 75,
            },
            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Octus_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 파워퀘이크
            {
                AICheckFrame        = 110,
                AIFunc              = "Octus_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 하울버스터
            {
                AICheckFrame        = 110,
                AIFunc              = "Octus_Check_Attack04",
                DelayFrame          = 440,
            },
			-- 몸통박치기
            {
                AICheckFrame        = 75,
                AIFunc              = "Octus_Check_Attack02",
                DelayFrame          = 165,
            },			
            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Octus_Check_Walk",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Octus_Walk.frm",
        Func    = "Octus_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Octus_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Octus_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Octus_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "Octus_Check_JumpUp",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 75,
                AIFunc              = "Octus_Check_JumpDown",
                DelayFrame          = 75,
            },
			-- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Octus_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 몸통박치기
            {
                AICheckFrame        = 75,
                AIFunc              = "Octus_Check_Attack02",
                DelayFrame          = 165,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Octus_Attack01.frm",
        Func    = "Octus_Attack01Func",
    },
    
    -- 파워차지(몸통박치기)
    {
        ID      = "ATTACK02",
        Motion  = "Octus_Attack02.frm",
        Func    = "Octus_Attack02Func",
    },
    
    -- 파워퀘이크
    {
        ID      = "ATTACK03",
        Motion  = "Octus_Attack03.frm",
        Func    = "Octus_Attack03Func",
    },
        
    -- 하울버스터
    {
        ID      = "ATTACK04",
        Motion  = "Octus_Attack04.frm",
        Func    = "Octus_Attack04Func",
    },
    
    -- 점프업
    {
        ID      = "JUMP",
        Motion  = "Octus_Jump.frm",
        Func    = "Octus_JumpFunc",
    },
    
    -- 점프다운
    {
        ID      = "JUMPDOWN",
        Motion  = "Octus_JumpDown.frm",
        Func    = "Octus_JumpFunc",
    },
--[[    
    -- 착지
    {
        ID      = "LANDING",
        Motion  = "Octus_Landing.frm",
        Func    = "Octus_LandingFunc",
    },
--]]    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Octus_Die.frm",
        Func    = "Octus_DieFunc",
    },
}

CallBack =
{
    Land    = "OnOctus_Land",
    Die     = "OnOctus_Die",
    Damage  = "OnOctus_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitOctus( iMonsterIndex )
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
function Octus_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function Octus_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Octus_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- 데미지 입은거
function Octus_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function Octus_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 착지 상태
function Octus_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Octus_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame < 41 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )		
	elseif( iFrame == 47 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:PlaySound(474)
    elseif( iFrame == 71 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:PlaySound(474)
    elseif( iFrame == 96 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:PlaySound(474)
    elseif( iFrame >= 106 and iFrame < 121 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.4 )
    elseif( iFrame >= 141 and iFrame < 145 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )
		if( iFrame == 141 ) then
			pMonster:PlaySound(474)
		end
    end
            
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		pMonster:PlaySound(474)
    elseif( iFrame == 51 ) then
        pMonster:AddDamage( DT_OCTUS_ATK1_1 )
    elseif( iFrame == 76 ) then
        pMonster:AddDamage( DT_OCTUS_ATK1_1 )
    elseif( iFrame == 91 ) then
        pMonster:AddDamage( DT_OCTUS_ATK1_1 )
    elseif( iFrame == 141 ) then
        pMonster:AddDamage( DT_OCTUS_ATK1_2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 파워차지(몸통박치기) 상태
function Octus_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
		pMonster:PlaySound(475)
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 5.0 )		
		pMonster:AddDamage( DT_OCTUS_ATK2 )
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_OCTUS_PARTICLE1_R )
			pMonster:AddDamage( DT_OCTUS_PARTICLE2_R )
		else
			pMonster:AddDamage( DT_OCTUS_PARTICLE1_L )
			pMonster:AddDamage( DT_OCTUS_PARTICLE2_L )
		end
	elseif( iFrame == 101 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.0 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

--  파워퀘이크 상태
function Octus_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("JUMP")
    elseif( iFrame == 66 ) then
		pMonster:AddDamage( DT_OCTUS_ATK3 )
	elseif( iFrame == 71 ) then
		pMonster:AddParticle( "Octus_special1_01", 0.2, 0.1 )
		pMonster:AddParticle( "Octus_special1_02", 0.2, 0.1 )
		pMonster:AddParticle( "Octus_special1_03", 0.2, 0.1 )
		pMonster:AddParticle( "Octus_special1_04", 0.2, 0.1 )
		pMonster:AddParticle( "Octus_special1_05", 0.2, 0.1 )
		pMonster:AddParticle( "Octus_special1_06", 0.2, 0.1 )
		pMonster:EarthQuake( 30, 0.06, 0.03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  하울버스터 상태
function Octus_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 ) then
		pMonster:PlaySound(477)
    elseif( iFrame == 71 ) then
        pMonster:AddParticle( "Octus_effect01", 0.0, 0.6 )		
    elseif( iFrame == 101 ) then
        pMonster:AddDamage( DT_OCTUS_ATK4 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Octus_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Octus_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Octus_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Octus_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Octus_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Octus_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function Octus_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 400, -400, -20, 400, -1000 ) == true ) then
        pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMPDOWN" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function Octus_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 200, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Octus_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -200, 300, 200, -60 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Octus_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then	
		pMonster:TurnToTarget()	
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Octus_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -800, 500, 800, -400 ) == true and pMonster:GetCountValue() >= 3) then
		pMonster:TurnToTarget()	
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Octus_Check_Attack05( iMonsterIndex, iFrame )
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


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnOctus_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then		
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
        pMonster:SetState( "WAIT" )
	end
end

function OnOctus_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnOctus_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.3 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK03" )	
		else
            pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02" )	
		end
        pMonster:SetSuperArmor(true)
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function Octus_Jump( iMonsterIndex )
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

function Octus_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true)then		
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

