-- AI_Carnival_Zidler.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "zidler_wait.frm",
        Func    = "Zidler_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 110,
                AIFunc              = "Zidler_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Zidler_Check_TurnToTarget",
                DelayFrame          = 40,
            },

            -- 하이점프
            {
                AICheckFrame        = 32,
                AIFunc              = "Zidler_Check_JumpUp",
                DelayFrame          = 110,
            },
            -- 점프다운
            {
                AICheckFrame        = 31,
                AIFunc              = "Zidler_Check_JumpDown",
                DelayFrame          = 55,
            },

            -- 머신건
            {
                AICheckFrame        = 111,
                AIFunc              = "Zidler_Check_Attack01",
                DelayFrame          = 111,
            },

            -- 개스 개스 [50%]
            {
                AICheckFrame        = 275,
                AIFunc              = "Zidler_Check_Attack02",
                DelayFrame          = 275,
            },

            -- 어스퀘이크 [75%]
            {
                AICheckFrame        = 99,
                AIFunc              = "Zidler_Check_Attack03",
                DelayFrame          = 333,
            },

            -- 지팡이공격
            {
                AICheckFrame        = 50,
                AIFunc              = "Zidler_Check_Attack04",
                DelayFrame          = 100,
            },

            -- 체코리 붐 [50%]
            {
                AICheckFrame        = 275,
                AIFunc              = "Zidler_Check_Attack06",
                DelayFrame          = 275,
            },

            -- 걷기
            {
                AICheckFrame        = 60,
                AIFunc              = "Zidler_Check_Walk",
                DelayFrame          = 120,
            },

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "zidler_move.frm",
        Func    = "Zidler_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Zidler_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Zidler_Check_Targeting",
                DelayFrame          = 55,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Zidler_Check_TurnToTarget",
                DelayFrame          = 30,
            },
            -- 하이점프
            {
                AICheckFrame        = 22,
                AIFunc              = "Zidler_Check_JumpUp",
                DelayFrame          = 110,
            },
            -- 점프다운
            {
                AICheckFrame        = 21,
                AIFunc              = "Zidler_Check_JumpDown",
                DelayFrame          = 55,
            },
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Zidler_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "zidler_attack01.frm",
        Func    = "Zidler_Attack01Func",
    },
    
    -- 개스개스
    {
        ID      = "ATTACK02",
        Motion  = "zidler_attack02.frm",
        Func    = "Zidler_Attack02Func",
    },
    
    -- 어스퀘이크
    {
        ID      = "ATTACK03",
        Motion  = "zidler_attack03.frm",
        Func    = "Zidler_Attack03Func",
    },
        
    -- 지팡이공격
    {
        ID      = "ATTACK04",
        Motion  = "zidler_attack04.frm",
        Func    = "Zidler_Attack04Func",
    },
	
    -- 체코리 붐
    {
        ID      = "ATTACK06",
        Motion  = "h_zidler_attack06.frm",
        Func    = "Zidler_Attack06Func",
    },

    -- 점프업
    {
        ID      = "JUMP",
        Motion  = "zidler_jump_up.frm",
        Func    = "Zidler_JumpFunc",
    },
    
    -- 점프다운
    {
        ID      = "JUMPDOWN",
        Motion  = "zidler_jump_down.frm",
        Func    = "Zidler_JumpFunc",
    },

    -- 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "zidler_jump_landing.frm",
        Func    = "Zidler_LandingFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "zidler_die.frm",
        Func    = "Zidler_DieFunc",
    },

    -- 출연 연출
    {
        ID      = "SHOW",
        Motion  = "zidler_attack01.frm",
        Func    = "Zidler_ShowFunc",
    },
}

CallBack =
{
    Land    = "OnZidler_Land",
    Die     = "OnZidler_Die",
    Damage  = "OnZidler_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitCarnival_Zidler( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:RegisterSummonMonsterType( MON_CARNIVAL_ZUGGLER )
	
	local MaxHP = pMonster:GetHP()
	local AttackPoint = pMonster:GetAttackPoint()
	if( 32 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *10
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	elseif( 52 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *15
		AttackPoint = AttackPoint *1.4
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	else
		MaxHP = MaxHP *70
		AttackPoint = AttackPoint *4
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	end

	pMonster:PlaySound(983024)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Zidler_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 26 ) then
		pMonster:PlaySound(983020)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function Zidler_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Zidler_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 153 ) then
		pMonster:PlaySound(983004)
	elseif( iFrame == 200 ) then
		pMonster:AddParticleNoDirection( "Circus_Zidler_Die_01", 0.0, 0.15 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Die_02", 0.0, 0.15 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Die_03", 0.0, 0.15 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Die_04", -0.06, 0.15 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Die_04", 0.06, 0.15 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Die_04", 0.0, 0.4 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster( TRUE, TRUE )
    end
end

-- 데미지 입은거
function Zidler_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function Zidler_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 착지 상태
function Zidler_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Zidler_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(983031)
	elseif( iFrame == 55 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage( DT_MON_ZIDLER_ATTACK01_R )
		else
			pMonster:AddDamage( DT_MON_ZIDLER_ATTACK01 )
		end
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(983005)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 개스개스 상태
function Zidler_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(983009)
	elseif( iFrame == 40 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 68 ) then
		pMonster:SetPushCheck( true )
		pMonster:AddDamage( DT_MON_ZIDLER_ATTACK02 )
		pMonster:PlaySound(983006)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  어스퀘이크 상태
function Zidler_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(983009)
		pMonster:PlaySound(983033)
	elseif( iFrame == 40 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 68 ) then
		pMonster:SetPushCheck( true )
		pMonster:EarthQuake( 30, 0.06, 0.02 )
		--pMonster:AddDamage( DT_MON_ZIDLER_ATTACK03 )
		pMonster:AddParticleNoDirection( "Elderkung_Down_01", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Elderkung_Down_02", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Elderkung_Down_03", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Kung_01", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Circus_Zidler_Kung_02", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  지팡이 공격 상태
function Zidler_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		--pMonster:PlaySound(983009)
		pMonster:PlaySound(983033)
	elseif( iFrame == 58 ) then
		pMonster:PlaySound(983008)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage( DT_MON_ZIDLER_ATTACK04_1_R )
			pMonster:AddParticleNoDirection( "Circus_Zidler_Swing_01_R", 0.25, 0.5 )
			pMonster:AddParticleNoDirection( "Circus_Zidler_Swing_02_R", 0.25, 0.5 )
			pMonster:AddParticleNoDirection( "Circus_Zidler_Swing_03_R", 0.25, 0.45 )
		else
			pMonster:AddDamage( DT_MON_ZIDLER_ATTACK04_1 )
			pMonster:AddParticleNoDirection( "Circus_Zidler_Swing_01", -0.25, 0.5 )
			pMonster:AddParticleNoDirection( "Circus_Zidler_Swing_02", -0.25, 0.5 )
			pMonster:AddParticleNoDirection( "Circus_Zidler_Swing_03", -0.25, 0.45 )
		end	
	elseif( iFrame == 70 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage( DT_MON_ZIDLER_ATTACK04_2_R )
		else
			pMonster:AddDamage( DT_MON_ZIDLER_ATTACK04_2 )
		end	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end    
end

--  체로키 붐
function Zidler_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local CheckSummonSlot=true;
	
	if( iFrame == 0 ) then
		CheckSummonSlot = pMonster:CheckSummonSlot()
	elseif( iFrame == 68 ) then
		if( 32 == pMonster:GetLevel() ) then
			pMonster:AddDamage( DT_MON_H_ZIDLER_ATTACK06_1 )
		elseif( 52 == pMonster:GetLevel() ) then
			pMonster:AddDamage( DT_MON_H_ZIDLER_ATTACK06_2 )
		else
			pMonster:AddDamage( DT_MON_H_ZIDLER_ATTACK06_3 )
		end
	elseif( iFrame == 70 ) then
		pMonster:PlaySound(983021)
	end
	
	if( iFrame >= pMonster:GetLastFrame() or false == CheckSummonSlot) then
        pMonster:SetState( "WAIT" )
	end
end

--  출연 연출
function Zidler_ShowFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 10 ) then
		pMonster:PlaySound(983031)
		pMonster:AddParticleNoDirection( "Circus_Paper_01", 0.0, 0.55 )
		pMonster:AddParticleNoDirection( "Circus_Paper_02", 0.0, 0.55 )
		pMonster:AddParticleNoDirection( "Circus_Paper_03", 0.0, 0.55 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Zidler_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1800, 600, 1800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Zidler_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Zidler_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -220, 660, 220, -600 ) == false ) then
			pMonster:TurnToTarget()
	        pMonster:SetState( "WALK" )
	        pMonster:ResetDelay()
		end
    end
end

function Zidler_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -220, 660, 220, -600 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Zidler_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 600, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Zidler_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function Zidler_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 300, -400, -100, 400, -600 ) == true ) then
        pMonster:SetNoCheckContact(30)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMPDOWN" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function Zidler_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 150, -150, 50, 150, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Zidler_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Zidler_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -500, 370, 500, -300 ) == false and pMonster:FloatRand() < 0.75 ) then
			pMonster:StartText("JUMP")
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK03" )
			pMonster:ResetDelay()
		end
    end
end

function Zidler_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 120, -120, 200, 120, 80 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Zidler_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 9 and pMonster:FloatRand() < 0.5 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnZidler_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then		
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
        pMonster:SetState( "WAIT" )
	end
end

function OnZidler_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and 
		pMonster:CheckState( "DOWN_UP02" ) == false and 
		pMonster:CheckState( "DOWN_MIDDLE" ) == false and 
		pMonster:CheckState( "DOWN_DOWN" ) == false and 
		pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
end

function OnZidler_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.3 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02" )
		else
            pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK03" )
		end
        pMonster:SetSuperArmor(true)
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function Zidler_Jump( iMonsterIndex )
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

function Zidler_MoveFail( iMonsterIndex )
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

