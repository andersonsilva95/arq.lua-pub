-- AI_Debris_WormholeDown.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "WormholeDown_WaitFunc",
    },
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "miragepot_wait.frm",
        Func    = "WormholeDown_DamageFunc",
    },
    
    {
        ID      = "DIE_LANDING",
        Motion  = "miragepot_wait.frm",
        Func    = "WormholeDown_DieLandingFunc",
    },
}

CallBack =
{
    Land    = "OnWormholeDown_Land",
    Die     = "OnWormholeDown_Die",
    Damage  = "OnWormholeDown_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitWormholeDown( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetIsRight(false)
    
    pMonster:AddTraceParticleToBone( "Chaos_Portal_01", 1.0, 0, 6, 6, 0.0, 0.4, true )
    pMonster:AddTraceParticleToBone( "Chaos_Portal_02", 1.0, 0, 6, 6, 0.0, 0.4, true )
    pMonster:AddTraceParticleToBone( "Chaos_Portal_03", 1.0, 0, 6, 6, 0.0, 0.4, true )
    pMonster:AddTraceParticleToBone( "Chaos_Portal_04", 1.0, 0, 5, 5, 0.0, 0.4, true )
    pMonster:AddTraceParticleToBone( "Chaos_Portal_05", 1.0, 0, 6, 6, 0.0, 0.4, true )
    
    pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE, 100000.0, 1, -1, false, false );
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function WormholeDown_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(false)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end


-- 죽기착지상태
function WormholeDown_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() == 0 ) then
			pMonster:SetCountValue(1)
	        pMonster:AddParticle( "Chaos_Portal_Boom_01", 0.0, 0.4 )
		    pMonster:AddParticle( "Chaos_Portal_Boom_02", 0.0, 0.4 )
		    pMonster:AddParticle( "Chaos_Portal_Boom_03", 0.0, 0.4 )
	        pMonster:AddParticle( "Tanatos_Gravity_Boom_03", 0.0, 0.4 )
	        pMonster:AddParticle( "Sieg04_Special3_01", 0.0, 0.4 )
	        pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE )
	        pMonster:EndMonster()
	        pMonster:SetFrameLock( true )
		end
    end
end

--  데미지 상태
function WormholeDown_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 )then 
        pMonster:AddParticle( "Chaos_Portal_HIT_01", 0.0, 0.0 )
        pMonster:AddParticle( "Chaos_Portal_HIT_02", 0.0, 0.0 )
        pMonster:AddParticle( "Chaos_Portal_HIT_03", 0.0, 0.0 )
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
function OnWormholeDown_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnWormholeDown_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE_LANDING" )
end

function OnWormholeDown_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end