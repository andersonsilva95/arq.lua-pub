-- AI_Debris_WhaleBox.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "WhaleBox_WaitFunc",
    },

	-- 죽기
    {
        ID      = "DIE",
        Motion  = "miragepot_wait.frm",
        Func    = "WhaleBox_DieLandingFunc",
    },
}

CallBack =
{
    Die     = "OnWhaleBox_Die",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitWhaleBox( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetIsRight(false)
    
    pMonster:AddTraceParticleToBone( "Devlis_Door", 1.0, 0, 9, 9, -0.01, 0.22, true )
	pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE, 100000.0, 1, -1, false, false );
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function WhaleBox_WaitFunc( iMonsterIndex, iFrame )
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
function WhaleBox_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetCountValue() == 0 ) then
		pMonster:SetCountValue(1)
		pMonster:SetInvincible( true )
		pMonster:AddParticle( "Devlis_Door_Clear", 0.01, 0.22 )

		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE )
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
	end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnWhaleBox_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

