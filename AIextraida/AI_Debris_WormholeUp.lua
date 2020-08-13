-- AI_Debris_WormholeUp.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "WormholeUp_WaitFunc",
    },
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "miragepot_wait.frm",
        Func    = "WormholeUp_DamageFunc",
    },
    
    {
        ID      = "DIE_LANDING",
        Motion  = "miragepot_wait.frm",
        Func    = "WormholeUp_DieLandingFunc",
    },
}

CallBack =
{
    Land    = "OnWormholeUp_Land",
    Die     = "OnWormholeUp_Die",
    Damage  = "OnWormholeUp_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitWormholeUp( iMonsterIndex )
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
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function WormholeUp_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(false)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end


-- �ױ���������
function WormholeUp_DieLandingFunc( iMonsterIndex, iFrame )
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

--  ������ ����
function WormholeUp_DamageFunc( iMonsterIndex, iFrame )
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
-- �����üũ
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnWormholeUp_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnWormholeUp_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE_LANDING" )
end

function OnWormholeUp_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end