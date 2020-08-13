-- AI_Tank.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Tank_Wait.frm",
        Func    = "Tank_WaitFunc",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Tank_Damage.frm",
        Func    = "Tank_DamageFunc",
    },
}

CallBack =
{
    Land    = "",
    Die     = "",
    Damage  = "OnTank_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------
function InitTank( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_NORMAL,           "DAMAGE" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Tank_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end 
end

-- 데미지 입은거
function Tank_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 30 ) then
        pMonster:AddDamageLastPlayers( 198 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function OnTank_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckPreState( "DAMAGE" ) == false ) then
		pMonster:SetPushCheck( true )
		pMonster:SetState("DAMAGE")
	end
end
