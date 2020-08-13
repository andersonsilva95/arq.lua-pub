-- AI_prison_back.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "prison_Wait.frm",
        Func    = "prison_back_WaitFunc",
    },
    
    -- 이동
    {
        ID      = "OPEN",
        Motion  = "prison_die.frm",
        Func    = "prison_back_moveFunc",
    },
}

CallBack =
{
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initprison_back( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetCountValue(0)
	pMonster:SetIsRight( false )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function prison_back_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster.DefRatio = 10000.0
	
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then				
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function prison_back_moveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onprison_back_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function Onprison_back_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	pMonster:AddCountValue(1)
	
	if ( pMonster:GetCountValue() >= 10 ) then
		pMonster:SetState( "DIE" )
	end
end