-- AI_eventbox.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "bossgate_waitFunc",
    },
    
    -- 데미지
    {
        ID      = "BOSSGATE_50",
        Motion  = "miragepot_wait.frm",
        Func    = "bossgate_Damage50Func",
    },
    
    -- 데미지
    {
        ID      = "BOSSGATE_0",
        Motion  = "miragepot_wait1.frm",
        Func    = "bossgate_Damage0Func",
    },
	
	-- 데미지
    {
        ID      = "BOSSGATE_SUMMON",
        Motion  = "miragepot_wait.frm",
        Func    = "bossgate_SummonFunc",
    },
    
    {
        ID      = "DIE_LANDING",
        Motion  = "miragepot_wait.frm",
        Func    = "bossgate_DieLanding1Func",
    },
    
}

CallBack =
{
    Land    = "Onbossgate_Land",
    Die     = "Onbossgate_Die",
    Damage  = "Onbossgate_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initbossgate( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetIsRight(true)
	pMonster:AddTraceParticleToBone( "Bossgate_01", 1.0, 0, 6, 6, 0.0, -0.05, true )
	pMonster:AddTraceParticleToBone( "Bossgate_Flame_01", 1.0, 0, 8, 8, 0.0, -0.05, true )
	pMonster:AddTraceParticleToBone( "Bossgate_Flame_02", 1.0, 0, 8, 8, 0.0, -0.05, true )
	pMonster:AddTraceParticleToBone( "Bossgate_Flame_03", 1.0, 0, 4, 4, 0.0, -0.05, true )
	pMonster:AddDamage(DT_BOSS_GATE_FULL)
	pMonster:AddDamage(DT_BOSS_GATE_HALF)
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function bossgate_waitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 꽝
function bossgate_DieLanding1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  데미지 상태
function bossgate_Damage50Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:SetCountValue(1)
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  데미지 상태
function bossgate_Damage0Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetInvincible( true )
    
    if( pMonster:GetCountValue() == 1 and iFrame == 10 ) then
		local posx = 0.0
		local posy = -0.05
		pMonster:AddParticle("Bossgate_Spark_01" , posx, posy)
		pMonster:AddParticle("Bossgate_Spark_02" , posx, posy)
		pMonster:AddParticle("Bossgate_Spark_03" , posx, posy)
		pMonster:AddParticle("Bossgate_Spark_04" , posx, posy)
		pMonster:AddParticle("Bossgate_Spark_05" , posx, posy)
		pMonster:AddTraceParticleToBone( "Bossgate_Hole_01", 1.0, 0, 8, 8, 0.0, posy, true )
		pMonster:AddTraceParticleToBone( "Bossgate_Hole_02", 1.0, 0, 8, 8, 0.0, posy, true )
		pMonster:AddTraceParticleToBone( "Bossgate_Hole_03", 1.0, 0, 5, 5, 0.0, posy, true )
		pMonster:AddTraceParticleToBone( "Bossgate_04", 1.0, 0, 6, 6, 0.0, posy, true )
		pMonster:SetCountValue(2)
		pMonster:InitTimer()
		pMonster:StartTimer()
	end
	
	if( iFrame == 70 ) then
		local posx = 0.0
		local posy = -0.1
		pMonster:AddParticleNoDirection("Bossgate_After_01", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_02", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_03", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_04", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_05", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_06", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_07", posx, posy )
		pMonster:AddParticleNoDirection("Bossgate_After_08", posx, posy )

		pMonster:AddDamage(DT_BOSS_GATE_BOMB)
		pMonster:AddDamage(DT_BOSS_GATE_BOMB_R)

	elseif( iFrame == 100 ) then
		pMonster:CameraVib( 2.3, 1.5, 0.04 )
		pMonster:PlaySound(995003)
	end

	if( iFrame >= 130 ) then
		pMonster:SetFrameLock( true )
		pMonster:SetState("DIE_LANDING")
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onbossgate_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function Onbossgate_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "BOSSGATE_0" )
end

function Onbossgate_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local posx = 0.15 - pMonster:FloatRand() *0.3
	local posy = pMonster:FloatRand() / 2.0
	pMonster:AddParticle("Bossgate_Hit_01" , posx, posy)
	pMonster:AddParticle("Bossgate_Hit_02" , posx, posy)
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )

    if( pMonster:GetCountValue() == 0 and pMonster:GetHP() / pMonster:GetMaxHP() <= 0.7 ) then
		pMonster:SetState("BOSSGATE_50")
    end
    
    if( pMonster:GetCountValue() == 1 and pMonster:GetHP() / pMonster:GetMaxHP() <= 0.2 ) then
		pMonster:SetState("BOSSGATE_0")
		pMonster:SetInvincible( true )
    end
end