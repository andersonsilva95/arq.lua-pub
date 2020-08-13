-- AI_KaruelBorder_ArrowShower.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_WaitFunc",
		
        Trigger =
        {
			--  타켓팅 샷 타켓팅( 첫번째 드라마 끝난 뒤 )
			{
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderArrowShower_Check_TargettingShotTargeting",
                DelayFrame          = 0,
            },
			-- 랜덤샷 타켓팅
            {
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderArrowShower_Check_RandomShotTargeting",
                DelayFrame          = 60,
            },
		},
    },
    -- 근접공격
    {
        ID      = "TARGETTING_SHOT",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Targetting_ATTACK",
    },
    -- 근접공격
    {
        ID      = "TARGETTING_SHOT2",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Targetting_ATTACK2",
    },
    -- 근접공격
    {
        ID      = "RANDOM_SHOT",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Random_ATTACK",
    },
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Die",
    },
}

CallBack =
{
    Damage  = "OnKaruelBorderArrowShower_Damage",
	Die  	= "OnKaruelBorderArrowShower_Die",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_ArrowShower( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetIsRight( false )
	pMonster:SetInvincible( true )
	pMonster:SetCountValue( 0 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderArrowShower_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ReleaseTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- 타켓팅공격
function KaruelBorderArrowShower_Targetting_ATTACK( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetPlayerTargetManual( 0 )	
		local vTargetPosX = pMonster:GetTargetX()
		local vTargetPosY = pMonster:GetTargetY()
		g_MyD3D:Setv3TempValue( vTargetPosX, vTargetPosY, 0.0 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
        pMonster:SetState( "TARGETTING_SHOT2" )
    end
end

-- 타켓팅공격2
function KaruelBorderArrowShower_Targetting_ATTACK2( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( 1 <= iFrame and iFrame < 49 ) then
		if( 0 == math.mod(iFrame, 5) ) then			
			local vTargetPos = g_MyD3D:Getv3TempValue()
			local vXPos = math.mod(iFrame, 3)
			pMonster:PlaySound(1304)
			pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARROWSHAWER_DOWNARROW, vTargetPos.x + (vXPos*0.07), vTargetPos.y + 2.6 )
			pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARROWSHAWER_DOWNARROW, vTargetPos.x + (vXPos*-0.07), vTargetPos.y + 2.6 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
        pMonster:SetState( "DIE" )
	end
end

-- 랜덤공격
function KaruelBorderArrowShower_Random_ATTACK( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame == 5 ) then
		local vDropPosX = GetFSMPosition( iMonsterIndex, iFrame )
		pMonster:Setv3TempValue( vDropPosX, 0.0, 0.0 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vDropPosX, 0.27 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ResetDelay()
        pMonster:SetState( "WAIT" )
    end
	
	if( 30 <= iFrame and iFrame < 80 ) then
		if( 0 == math.mod(iFrame, 5) ) then			
			local vTargetPos = pMonster:Getv3TempValue()
			local vXPos = math.mod(iFrame, 3)
			pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARROWSHAWER, vTargetPos.x + (vXPos*0.07), 2.87 )
			pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARROWSHAWER, vTargetPos.x + (vXPos*-0.07), 2.87 )
		end
	end
end

-- 죽었음
function KaruelBorderArrowShower_Die( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function KaruelBorderArrowShower_Check_RandomShotTargeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -60, 10, 60, -60 ) == true ) then
		if( 0 ~= g_MyD3D:GetActiveStage() ) then
			pMonster:SetState( "RANDOM_SHOT" )
			pMonster:ResetDelay()
		end
    end
end

function KaruelBorderArrowShower_Check_TargettingShotTargeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( 0 == g_MyD3D:GetActiveStage() ) then
		pMonster:SetState( "TARGETTING_SHOT" )
		pMonster:ResetDelay()
	end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelBorderArrowShower_Die( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnKaruelBorderArrowShower_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( false )
end

function GetFSMPosition( iMonsterIndex, iFrame )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    -- 네트워크 플레이어들이 가지고 있는 공통된 정보로 랜덤을 만들자!!
    local fPosRatio = pMonster:GetX() / 4.4;
    local fHPRatio = pMonster:GetHP() / pMonster:GetMaxHP();
    
    -- 0에서 1사이값을 0에서 60사이값으로 변환
    fPosRatio = fPosRatio * 60
    fHPRatio = fHPRatio * 60
    
    -- 현재 프레임을 적용해서 0에서 5사이값으로 변환
    local iSelect = math.floor(fPosRatio+fHPRatio)
    iSelect = (iSelect%4)
    iSelect = iSelect + (iFrame%3)
    
    -- 이전에 선택한 값과 같으면 값변경( 최대한 인접하거나 같은 곳에 뿌려지길 거부한다 )
    if( iSelect == pMonster:GetCountValue() ) then
        iSelect = iSelect + 1
    elseif( iSelect == pMonster:GetCountValue() - 1 ) then
        iSelect = pMonster:GetCountValue() - 2
    elseif( iSelect == pMonster:GetCountValue() + 1 ) then
        iSelect = pMonster:GetCountValue() + 2
    end
    
    if( 5 < iSelect ) then
        iSelect = 0
    elseif( 0 > iSelect ) then
        iSelect = 5
    end
    
    -- 선택된값 저장
    pMonster:SetCountValue( iSelect )
    
    -- 선택완료
    if( 0 == iSelect ) then
        return 0.36
    elseif( 1 == iSelect ) then
        return 1.13
    elseif( 2 == iSelect ) then
        return 1.9
    elseif( 3 == iSelect ) then
        return 2.63
    elseif( 4 == iSelect ) then
        return 3.38
    elseif( 5 == iSelect ) then
        return 4.15
    end
    
    return 0.0
end