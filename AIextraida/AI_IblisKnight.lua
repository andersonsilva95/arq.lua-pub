-- AI_IblisKnight.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "IblisKnight_Wait.frm",
        Func    = "IblisKnight_WaitFunc",
    },

    -- 안구 광선
    {
        ID      = "ATTACK01",
        Motion  = "IblisKnight_Attack01.frm",
        Func    = "IblisKnight_Attack01Func",
    },
    
    -- 저리가
    {
        ID      = "ATTACK02",
        Motion  = "IblisKnight_Attack02.frm",
        Func    = "IblisKnight_Attack02Func",
    },
    
    -- 
    {
        ID      = "ATTACK03",
        Motion  = "IblisKnight_Attack03.frm",
        Func    = "IblisKnight_Attack03Func",
    },
    
    -- 
    {
        ID      = "ATTACK03",
        Motion  = "IblisKnight_Attack03.frm",
        Func    = "IblisKnight_Attack03Func",
    },
    
    -- 순칸이동
    {
        ID      = "ATTACK04",
        Motion  = "IblisKnight_Attack04_A.frm",
        Func    = "IblisKnight_Attack04Func",
    },
    
    -- 순칸이동~
    {
        ID      = "ATTACK04_ATK",
        Motion  = "IblisKnight_Attack04_B.frm",
        Func    = "IblisKnight_Attack04AtkFunc",
    },
    
    -- 
    {
        ID      = "BLOCK",
        Motion  = "IblisKnight_guard.frm",
        Func    = "IblisKnight_BlockFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "IblisKnight_Die.frm",
        Func    = "IblisKnight_DieFunc",
    },
}

CallBack =
{
    Land    = "OnIblisKnight_Land",
    Die     = "OnIblisKnight_Die",
    Damage  = "OnIblisKnight_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitIblisKnight( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetTraceIndex(0,-1)
	pMonster:SetTraceGap( 0.3, 0.0 )
	pMonster:SetTrace(true)
	pMonster:SetFly(true)
	pMonster.DefRatio = 100000000.0
	
	pMonster:AddTraceParticleToBone( "Iblis_Hand", 1.0, 18, 6, 6, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Iblis_Hand", 1.0, 37, 6, 6, 0.0, 0.05 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function IblisKnight_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetTrace(true)
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽는상태
function IblisKnight_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(997010)
		pMonster:SetTrace(false)
    elseif( iFrame >= pMonster:GetLastFrame() - 3 ) then
        pMonster:EndMonster()
    end
end

-- 데미지 입은거
function IblisKnight_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function IblisKnight_DamageDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetPushCheck( true )
    end
end

--  X Slash
function IblisKnight_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 2 ) then
		local particleX = 0.1
		local particleY = 0.9
		if( not pMonster:GetIsRight() ) then
			particleX = particleX * -1.0
		end
		pMonster:AddParticleNoDirection( "Iblis_Laser_Charge_01", particleX, particleY )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Charge_02", particleX, particleY )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Charge_03", particleX, particleY )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Charge_04", particleX, particleY )
    elseif( iFrame == 40 ) then
		local particleX = 0.1
		local particleY = 0.9
		if( not pMonster:GetIsRight() ) then
			particleX = particleX * -1.0
		end
		pMonster:AddParticleNoDirection( "Iblis_Laser_Shot_01", particleX, particleY )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Shot_02", particleX, particleY )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Shot_03", particleX, particleY )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Shot_04", particleX, particleY )
        pMonster:AddDamageWithLocate(DT_IBLIS_LASER_SHOOTER, 0.0, 0.0)
    elseif( iFrame == 59 ) then
		pMonster:PlaySound(995015)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 근접공격
function IblisKnight_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:PlaySound(995016)
		pMonster:AddDamage(DT_IBLIS_GETAWAY)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  반격 손바닥 짝
function IblisKnight_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddParticle("Iblis_Eyelight_01", 0.13, 0.8)
        pMonster:AddParticle("Iblis_Eyelight_02", 0.13, 0.8)
    elseif( iFrame == 37 ) then
		pMonster:PlaySound(995017)
	elseif( iFrame == 65 ) then
		pMonster:AddDamage(DT_IBLIS_SCISSORHANDS)
	elseif( iFrame == 74 ) then
		local particleX = 0.6
		local particleY = 0.3
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Iblis_Expectation_Scratch_01", -particleX, particleY )
			pMonster:AddParticleNoDirection( "Iblis_Expectation_Scratch_02", particleX, particleY )
		else
			pMonster:AddParticleNoDirection( "Iblis_Expectation_Scratch_01_R", particleX, particleY )
			pMonster:AddParticleNoDirection( "Iblis_Expectation_Scratch_02_R", -particleX, particleY )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  반격 손바닥 짝
function IblisKnight_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetTrace(false)
        pMonster:AddParticle("Iblis_Eyeflame_01", 0.13, 0.8)
    elseif( iFrame == pMonster:GetLastFrame() - 10 ) then
		pMonster:AddParticle("Iblis_Teleport_01", 0.0, 0.5)
		pMonster:AddParticle("Iblis_Teleport_02", 0.0, 0.5)
		pMonster:AddParticle("Iblis_Teleport_03", 0.0, 0.5)
	elseif( iFrame == pMonster:GetLastFrame() ) then
		
        fDistX = 0.5
		if( pMonster:GetTargetIsRight() and pMonster:GetTargetX() > fDistX ) then
			pMonster:SetX( pMonster:GetTargetX() - fDistX )
			pMonster:SetIsRight( true )
		else
			pMonster:SetX( pMonster:GetTargetX() + fDistX )
			pMonster:SetIsRight( false )
			
			if( pMonster:GetTargetX() > pMonster:GetStageX() - fDistX ) then
				fDistX = fDistX * -1.0
				pMonster:SetIsRight( true )
			end
		end
		
		pMonster:SetY( pMonster:GetTargetY() )
        pMonster:SetState( "ATTACK04_ATK" )
    end
end

--  반격 손바닥 짝
function IblisKnight_Attack04AtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 6 ) then
		pMonster:AddDamage(DT_IBLIS_SHADOW_ATK1)
	elseif( iFrame == 11 ) then
		pMonster:PlaySound(995018)
		local particleX = 0.55
		local particleY = 0.45
		if( not pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Iblis_Crying_Scratch_01", -particleX, particleY )
		else
			pMonster:AddParticleNoDirection( "Iblis_Crying_Scratch_01_R", particleX, particleY )
		end
	elseif( iFrame == 18 ) then
		pMonster:AddDamage(DT_IBLIS_SHADOW_ATK1)
	elseif( iFrame == 22 ) then
		local particleX = 0.6
		local particleY = 0.5
		if( not pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Iblis_Crying_Scratch_02", -particleX, particleY )
		else
			pMonster:AddParticleNoDirection( "Iblis_Crying_Scratch_02_R", particleX, particleY )
		end
	elseif( iFrame == 32 ) then
		pMonster:AddDamage(DT_IBLIS_SHADOW_ATK2)
	elseif( iFrame == 36 ) then
		local particleX = 0.55
		local particleY = 0.45
		if( not pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Iblis_Crying_Scratch_01", -particleX, particleY )
		else
			pMonster:AddParticleNoDirection( "Iblis_Crying_Scratch_01_R", particleX, particleY )
		end
	elseif( iFrame == pMonster:GetLastFrame() - 15 ) then
		pMonster:AddParticle("Iblis_Teleport_01", 0.0, 0.5)
		pMonster:AddParticle("Iblis_Teleport_02", 0.0, 0.5)
		pMonster:AddParticle("Iblis_Teleport_03", 0.0, 0.5)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		local pMon = g_MyD3D:GetMonster( 0 )
        pMonster:SetState( "WAIT" )
        pMonster:SetX( pMon:GetX() )
        pMonster:SetY( pMon:GetY() )
        pMonster:SetTrace(true)
    end
end

--  반격 손바닥 짝
function IblisKnight_BlockFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnIblisKnight_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
    end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function OnIblisKnight_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnIblisKnight_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end

function IblisKnight_Jump( iMonsterIndex )
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