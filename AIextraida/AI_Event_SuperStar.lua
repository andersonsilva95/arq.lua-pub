-- AI_eventbox.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "eventbox_Wait.frm",
        Func    = "eventbox_WaitFunc",
    },
    --[[
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "eventbox_damage.frm",
        Func    = "eventbox_DamageFunc",
    },
	--]]
    
    {
        ID      = "DIE_LANDING_SPUER",
        Motion  = "eventbox_Die.frm",
        Func    = "eventbox_DieLandingSuperFunc",
    },
}

CallBack =
{
    Land    = "Onsupereventbox_Land",
    Die     = "Onsupereventbox_Die",
    Damage  = "Onsupereventbox_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function IniteventboxMec( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetIsRight(true)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function eventbox_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 이동 상태
function eventbox_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end


-- 죽기착지상태
function eventbox_DieLandingSuperFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	
	elseif( iFrame == 2 ) then
		for i = 0, 6 do 
			local player = g_MyD3D:GetPlayer( i )
			if( player:IsLive() == true ) then
				player:SetMagicEffect(EGC_EFFECT_SUPERSTAR_BUFF, 60.0)
				player:SetPlayerHP( player:GetPlayerMaxHP() )	
				player:ChangeAllCharacterMP( 3.0 )
			end
		end
			
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  데미지 상태
function eventbox_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING_SPUER" )
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onsupereventbox_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function Onsupereventbox_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE_LANDING_SPUER" )
end

function Onsupereventbox_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end