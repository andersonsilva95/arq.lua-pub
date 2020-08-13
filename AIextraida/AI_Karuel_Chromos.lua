-- AI_Karuel_Chromos.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Chromos_f_wait.frm",
        Func    = "KaruelChromos_WaitFunc",

        Trigger =
        {

			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelChromos_Check_Targeting",
                DelayFrame          = 55,
            },
            -- 타겟지움
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelChromos_Check_ReleaseTarget",
                DelayFrame          = 80,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelChromos_Check_TurnToTarget",
                DelayFrame          = 40,
            },
            -- 공격08(몬스터가 왼쪽에 박혀 있을 때 반대쪽으로 그냥 뛰어버려라)
            {
                AICheckFrame        = 100,
                AIFunc              = "KaruelChromos_Check_Attack08",
                DelayFrame          = 550,
            },
            -- 공격01(밟기)
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelChromos_Check_Attack01",
                DelayFrame          = 100,
            },
            -- 공격02(머리박치기)
            {
                AICheckFrame        = 120,
                AIFunc              = "KaruelChromos_Check_Attack02",
                DelayFrame          = 550,
            },
            -- 공격03(화염숨결)
            {
                AICheckFrame        = 90,
                AIFunc              = "KaruelChromos_Check_Attack03",
                DelayFrame          = 150,
            },
            -- 공격04(하울링)
            {
                AICheckFrame        = 110,
                AIFunc              = "KaruelChromos_Check_Attack04",
                DelayFrame          = 300,
            },
            -- 공격05(프로텍션 프롬 파이어)
            {
                AICheckFrame        = 80,
                AIFunc              = "KaruelChromos_Check_Attack05",
                DelayFrame          = 1100,
            },
            -- 공격06(점프공격)
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelChromos_Check_Attack06",
                DelayFrame          = 220,
            },
            -- 공격07(포효)
            {
                AICheckFrame        = 100,
                AIFunc              = "KaruelChromos_Check_Attack07",
                DelayFrame          = 320,
            },
			
        }
    },
    
    -- 공격01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Chromos_f_attack01.frm",
        Func    = "KaruelChromos_Attack01Func",
    },
    
    -- 공격02
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Chromos_f_attack02.frm",
        Func    = "KaruelChromos_Attack02Func",
    },

    -- 공격03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Chromos_f_attack03.frm",
        Func    = "KaruelChromos_Attack03Func",
    },
    
    -- 공격04
    {
        ID      = "ATTACK04",
        Motion  = "Mon_Chromos_f_attack04.frm",
        Func    = "KaruelChromos_Attack04Func",
    },
	
    -- 공격05
    {
        ID      = "ATTACK05",
        Motion  = "Mon_Chromos_f_attack05.frm",
        Func    = "KaruelChromos_Attack05Func",
    },
	
    -- 공격06
    {
        ID      = "ATTACK06",
        Motion  = "Mon_Chromos_f_attack06.frm",
        Func    = "KaruelChromos_Attack06Func",
    },	
    -- 공격07
    {
        ID      = "ATTACK07",
        Motion  = "Mon_Chromos_f_attack07.frm",
        Func    = "KaruelChromos_Attack07Func",
    },
    
	-- 공격08
    {
        ID      = "ATTACK08",
        Motion  = "Mon_Chromos_f_attack02.frm",
        Func    = "KaruelChromos_Attack08Func",
    },
    -- 쉴드제거
    {
        ID      = "ZERO_SHIELD",
        Motion  = "Mon_Chromos_f_wait.frm",
        Func    = "KaruelChromos_ZeroShieldFunc",
    },
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Mon_Chromos_f_die.frm",
        Func    = "KaruelChromos_DieFunc",
    },
}

CallBack =
{
    Land    = "OnKaruelChromos_Land",
    Damage  = "OnKaruelChromos_Damage",
    DamageBeforeChange  = "OnKaruelChromos_DamageBeforeChange",
	Die     = "OnKaruelChromos_Die",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelChromos( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue( 0 )
	pMonster:SetMapTempValue( "ATTACK04", 0 )
    pMonster:SetMapTempValue( "SHIELD_STATE", 0 )
	pMonster:SetInitAI( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelChromos_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:GetInitAI() ) then
		g_kCamera.WideMode = 7
		pMonster:SetInitAI( false )
	end
    
    local iShield = pMonster:GetMapTempValue( "SHIELD_STATE" )
	if( 1 == iShield ) then
		pMonster:SetTexture( "" )
		pMonster:SetMapTempValue( "SHIELD_STATE", 0 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Foce_Boom_01", 0.1, 0.3 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Foce_Boom_02", 0.1, 0.3 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Foce_Boom_03", 0.1, 0.3 )
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end

-- 쉴드제거
function KaruelChromos_ZeroShieldFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetShield( 0.0 )
    pMonster:SetMapTempValue( "SHIELD_STATE", 1 )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState("WAIT")
    end
end

-- 죽기
function KaruelChromos_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(984001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        --pMonster:SetMapTempValue( "SHIELD", -1 )
		--pMonster:SetShield( 0.0 )
		pMonster:EndMonster(true, true, true)
        pMonster:SetFrameLock( true )
    end
end

--  공격01
function KaruelChromos_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:PlaySound(990002)
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK1, 0.45, 1.2 )
	elseif( iFrame == 60 ) then
		--g_kCamera:SetEarthQuake(25)				
		pMonster:PlaySound(1255)
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_01" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_02" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_03" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_04" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_05" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_06" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_07" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_08" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_09" , 1.1, 0.05 )
		pMonster:AddParticle("Dun_Karuel_Boss_Foot_10" , 1.1, 0.05 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격02
function KaruelChromos_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(999038)
		pMonster:PlaySound(990009)
	elseif( iFrame == 45 ) then
		if (pMonster:GetIsRight() ) then
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK2, 0.0, 0.0 )
		else
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK2_R, 0.0, 0.0 )
		end
	elseif( iFrame == 55 or iFrame == 75  or iFrame == 95 ) then
		g_kCamera:SetEarthQuake(21)				
	elseif( 50 < iFrame and iFrame < 100 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	elseif( iFrame >= 100 ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격03
function KaruelChromos_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( 30 < iFrame and iFrame < 60 ) then
		pMonster:PullPlayer( 0.0, 1.0 )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:PlaySound( 998004 )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Mouse_01", 1.0, 8, 8, 8, 0.2, 0.0, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Mouse_02", 1.0, 8, 8, 8, 0.2, 0.0, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Mouse_03", 1.0, 8, 8, 8, 0.2, 0.0, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Mouse_04", 1.0, 8, 8, 8, 0.2, 0.0, false )
	elseif( iFrame == 50 ) then
		pMonster:PlaySound( 998005 )
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK3_BEFORE, 0.1, 1.2 )
	elseif( iFrame == 60 ) then
		local posx = 1.2
		local posy = 0.09
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Breath_01", 1.0, 8, 8, 8, 0.2, -0.05, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Breath_02", 1.0, 8, 8, 8, 0.2, -0.05, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Breath_03", 1.0, 8, 8, 8, 0.2, -0.05, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Breath_04", 1.0, 8, 8, 8, 0.2, -0.05, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Breath_05", 1.0, 8, 8, 8, 0.2, -0.05, false )
		pMonster:AddTraceParticleToBone( "Dun_Karuel_Boss_Breath_06", 1.0, 8, 8, 8, 0.2, -0.05, false )
	elseif( iFrame == 63 ) then
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK3_EFF, 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격04
function KaruelChromos_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 10 ) then
		pMonster:PlaySound(980001)
	elseif( iFrame == 80 ) then
		pMonster:PlaySound(980002)
    elseif( iFrame == 100 ) then
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK4_HOWLING_EFF, 0.7, 3.0 )
		else
			pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK4_HOWLING, 0.7, 3.0 )
		end
		pMonster:CameraVib( 0.0, 4.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Howling_01", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Howling_02", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Howling_03", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Howling_04", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Howling_05", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Howling_06", 0.0, 0.1 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

--  공격05
function KaruelChromos_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(994020)
		pMonster:AddParticle( "Dun_Karuel_Boss_Magic_01", 0.0, 0.1 )
		--pMonster:AddParticle( "Dun_Karuel_Boss_Magic_02", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Magic_03", 0.0, 0.1 )
		--pMonster:AddParticle( "Dun_Karuel_Boss_Magic_04", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Magic_05", 0.0, 0.1 )
		pMonster:AddParticle( "Dun_Karuel_Boss_Magic_06", 0.0, 0.1 )
	elseif( iFrame == 20 ) then
        pMonster:SetMapTempValue( "SHIELD_STATE", 2 )
		pMonster:SetShield( pMonster:GetHP() * 0.125 )
		pMonster:SetShieldEffect("Dun_Karuel_Boss_Shield_01", 0.0, 0.24)
		pMonster:SetShieldEffect("Dun_Karuel_Boss_Shield_02", 0.0, 0.3)
		pMonster:SetShieldEffect("Dun_Karuel_Boss_Foce_01", 0.0, 0.6)
		pMonster:SetShieldEffect("Dun_Karuel_Boss_Foce_02", 0.0, 0.6)
		pMonster:SetTexture( "Mon_Chromos_p_body_black.dds" )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격06
function KaruelChromos_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:SetInvincible( true )
	elseif( iFrame == 45 ) then
		pMonster:EarthQuake( 30, 0.0, 0.0 )
	elseif( iFrame == 50 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetFly( true )
		--pMonster:AddParticle("Dun_Karuel_Boss_Jump_06" , 0.0, 0.0 )
		--pMonster:AddParticle("Dun_Karuel_Boss_Jump_Down_03" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_Down_07" , 0.1, 0.0 )
		pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Shadow_01", 0.0, -9.9 )
		pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Shadow_02", 0.0, -9.9 )
		pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Shadow_03", 0.0, -9.9 )
	elseif( iFrame == 60 ) then
		pMonster:SetY( pMonster:GetY() + 10.0 )
	--elseif( iFrame == 110 ) then
		--pMonster:StartAfterImage()
	elseif( 127 <= iFrame and iFrame <= 170 ) then
		local fMyX = pMonster:GetX()
		local fTargetX = pMonster:GetTargetX()
		if( not ((fTargetX - 0.1) <= fMyX and fMyX <= (fTargetX + 0.1)) ) then
			if( fTargetX > fMyX ) then
				pMonster:SetSpeedX( 0.05 )
				pMonster:SetIsRight( true )
			else
				pMonster:SetSpeedX( -0.05 )
				pMonster:SetIsRight( false )
			end
		else
			pMonster:SetSpeedX( 0.0 )
		end
	elseif( iFrame == 171 ) then
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame == 190 ) then
		pMonster:SetFly( false )
		pMonster:SetY( pMonster:GetY() - 10.0 )
	elseif( iFrame == 195 ) then
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK6_TRACE, pMonster:GetX(), pMonster:GetY() )
	elseif( iFrame == 200 ) then
		pMonster:EarthQuake( 60, 0.0, 0.0 )
		--pMonster:SetPushCheck( true )
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK6, pMonster:GetX(), pMonster:GetY() )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_01" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_02" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_03" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_04" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_05" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_06" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_Down_01" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_Down_02" , 0.0, 0.0 )
		pMonster:AddParticle("Dun_Karuel_Boss_Jump_Down_03" , 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:EndAfterImage()
		pMonster:SetState( "WAIT" )
		pMonster:PlaySound(999040)
    end
end

--  공격07
function KaruelChromos_Attack07Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
		pMonster:PlaySound(984005)
		pMonster:AddDamageWithLocate( DT_SKILL_READY_CIRCLE, 1.0, 0.3)
    elseif( iFrame == 50 ) then
		pMonster:PlaySound(996006, 1)
    elseif( iFrame == 92 ) then	
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK7_EFF, 0.0, 0.0 )
		else
			pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK7, 3, 1.5 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격08
function KaruelChromos_Attack08Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(999038)
		pMonster:PlaySound(990009)
	elseif( iFrame == 45 ) then
		if (pMonster:GetIsRight() ) then
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK2, 0.0, 0.0 )
		else
		pMonster:AddDamageWithLocate( DT_KARUEL_MON_CHROMOS_ATK2_R, 0.0, 0.0 )
		end
	elseif( iFrame == 55 or iFrame == 75  or iFrame == 95 ) then
		g_kCamera:SetEarthQuake(21)				
	elseif( 50 < iFrame and iFrame < 120 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	elseif( iFrame >= 120 ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function KaruelChromos_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -3400, 1100, 3400, -1100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelChromos_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -600, 550, 600, -600 ) == false ) then
		pMonster:ReleaseTarget( true )
        pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelChromos_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -240, 120, 240, -100  ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 900, -2500, 350, 2500, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 600, -300, 110, 300, -100 ) == true and pMonster:GetX() > 1.5 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -2500, 800, 2500, 320 ) == true and pMonster:GetX() > 2.0 ) then
			pMonster:TurnToTarget()
			pMonster:SetMapTempValue( "ATTACK04", 0 )
			pMonster:SetState( "ATTACK04" )
			pMonster:ResetDelay()
	elseif (  pMonster:CheckTargetInRange( 0, -2500, 800, 2500, 320 ) == true and pMonster:GetX() <= 2.0 ) then
			pMonster:SetMapTempValue( "ATTACK04", 1 )
			pMonster:SetState( "ATTACK04" )
			pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    local iShield = pMonster:SetMapTempValue( "SHIELD" )
    if( 0.0 == iShield ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	-- 범위안에 적이 하나도 없으면 가장 멀리있는 캐릭터를 타켓팅하고 아주 죽여버려랏!!
	if( pMonster:IsTarget() == true) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

function KaruelChromos_Check_Attack07( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK07" )
		pMonster:ResetDelay()
end

function KaruelChromos_Check_Attack08( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetX() <= 1.5 ) then
		pMonster:SetIsRight( true )
		pMonster:SetState( "ATTACK08" )
		pMonster:ResetDelay()
	end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelChromos_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

end

function OnKaruelChromos_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0 )
	pMonster:SetSpeedY( 0 )
end

function OnKaruelChromos_DamageBeforeChange( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( (0.0 == pMonster:GetShield()) and
        (2 == pMonster:GetMapTempValue( "SHIELD_STATE" )) ) then
        pMonster:SetState( "ZERO_SHIELD" )
    end
end

function OnKaruelChromos_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end
