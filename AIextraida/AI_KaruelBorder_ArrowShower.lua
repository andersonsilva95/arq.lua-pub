-- AI_KaruelBorder_ArrowShower.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_WaitFunc",
		
        Trigger =
        {
			--  Ÿ���� �� Ÿ����( ù��° ��� ���� �� )
			{
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderArrowShower_Check_TargettingShotTargeting",
                DelayFrame          = 0,
            },
			-- ������ Ÿ����
            {
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderArrowShower_Check_RandomShotTargeting",
                DelayFrame          = 60,
            },
		},
    },
    -- ��������
    {
        ID      = "TARGETTING_SHOT",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Targetting_ATTACK",
    },
    -- ��������
    {
        ID      = "TARGETTING_SHOT2",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Targetting_ATTACK2",
    },
    -- ��������
    {
        ID      = "RANDOM_SHOT",
        Motion  = "Mon_ArrowShower_f_Wait.frm",
        Func    = "KaruelBorderArrowShower_Random_ATTACK",
    },
    -- �ױ�
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
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorder_ArrowShower( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetIsRight( false )
	pMonster:SetInvincible( true )
	pMonster:SetCountValue( 0 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderArrowShower_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ReleaseTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- Ÿ���ð���
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

-- Ÿ���ð���2
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

-- ��������
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

-- �׾���
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
-- �����üũ
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
-- �ݹ� �Լ�
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
    
    -- ��Ʈ��ũ �÷��̾���� ������ �ִ� ����� ������ ������ ������!!
    local fPosRatio = pMonster:GetX() / 4.4;
    local fHPRatio = pMonster:GetHP() / pMonster:GetMaxHP();
    
    -- 0���� 1���̰��� 0���� 60���̰����� ��ȯ
    fPosRatio = fPosRatio * 60
    fHPRatio = fHPRatio * 60
    
    -- ���� �������� �����ؼ� 0���� 5���̰����� ��ȯ
    local iSelect = math.floor(fPosRatio+fHPRatio)
    iSelect = (iSelect%4)
    iSelect = iSelect + (iFrame%3)
    
    -- ������ ������ ���� ������ ������( �ִ��� �����ϰų� ���� ���� �ѷ����� �ź��Ѵ� )
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
    
    -- ���õȰ� ����
    pMonster:SetCountValue( iSelect )
    
    -- ���ÿϷ�
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