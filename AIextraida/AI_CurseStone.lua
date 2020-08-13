-- AI_CurseStone.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "CurseStone_Wait.frm",
        Func    = "CurseStone_WaitFunc",
    },
	
	-- 죽음
    {
        ID      = "DIE",
        Motion  = "CurseStone_Die.frm",
        Func    = "CurseStone_DieFunc",
    },
}

CallBack =
{
    Land    	= "OnCurseStone_Land",
    Die     	= "OnCurseStone_Die",
    Damage  	= "OnCurseStone_Damage",
    End		= "OnCurseStone_End",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitCurseStone( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function CurseStone_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( math.mod( iFrame, 4 ) == 0 ) then
		pMonster:AddDamage( DT_MANASTONE01 )
	end
	
	if( iFrame == 3 ) then
		pMonster:SetIsRight( true )
		pMonster:AddParticle("Stone_Effect_01", 0.0, 0.34 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then				
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function CurseStone_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:AddParticle("Stone_Boom_01", 0.0, 0.3 )
		pMonster:AddParticle("Stone_Boom_02", 0.0, 0.3 )
		pMonster:AddParticle("Stone_Boom_03", 0.0, 0.3 )
		pMonster:AddParticle("Stone_Boom_04", 0.0, 0.3 )
		pMonster:AddDamage( DT_MANASTONE02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnCurseStone_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function OnCurseStone_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnCurseStone_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	
	
end

-- 몬스터가 죽고 깜빡이기까지 끝난 후에 호출되는 함수
function OnCurseStone_End( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	--pMonster:AddDamage( DT_MANASTONE02 )

end
